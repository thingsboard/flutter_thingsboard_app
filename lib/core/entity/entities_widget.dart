import 'dart:async';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class EntitiesWidgetController {

  final List<_EntitiesWidgetState> states = [];

  void _registerEntitiesWidgetState(_EntitiesWidgetState entitiesWidgetState) {
    states.add(entitiesWidgetState);
  }

  void _unregisterEntitiesWidgetState(_EntitiesWidgetState entitiesWidgetState) {
    states.remove(entitiesWidgetState);
  }

  Future<void> refresh() {
    return Future.wait(states.map((state) => state._refresh()));
  }

  void dispose() {
    states.clear();
  }

}

abstract class EntitiesWidget<T extends BaseData> extends TbContextWidget<EntitiesWidget<T>, _EntitiesWidgetState<T>> with EntitiesBase<T> {

  final entityDateFormat = DateFormat('yyyy-MM-dd');
  final EntitiesWidgetController? _controller;

  EntitiesWidget(TbContext tbContext, {EntitiesWidgetController? controller}):
      _controller = controller,
      super(tbContext);

  @override
  _EntitiesWidgetState createState() => _EntitiesWidgetState(_controller);

  void onViewAll();

}

class _EntitiesWidgetState<T extends BaseData> extends TbContextState<EntitiesWidget<T>, _EntitiesWidgetState<T>> {

  final EntitiesWidgetController? _controller;

  final StreamController<PageData<T>?> _entitiesStreamController = StreamController.broadcast();

  _EntitiesWidgetState(EntitiesWidgetController? controller):
     _controller = controller;

  @override
  void initState() {
    super.initState();
    if (_controller != null) {
      _controller!._registerEntitiesWidgetState(this);
    }
   _refresh();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!._unregisterEntitiesWidgetState(this);
    }
    _entitiesStreamController.close();
    super.dispose();
  }

  Future<void> _refresh() {
    _entitiesStreamController.add(null);
    var entitiesFuture = widget.fetchEntities(PageLink(5, 0, null, SortOrder('createdTime', Direction.DESC)));
    entitiesFuture.then((value) => _entitiesStreamController.add(value));
    return entitiesFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 0,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      height: 24,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          StreamBuilder<PageData<T>?>(
                            stream: _entitiesStreamController.stream,
                            builder: (context, snapshot) {
                              var title = widget.title;
                              if (snapshot.hasData) {
                                 var data = snapshot.data;
                                 title += ' (${data!.totalElements})';
                              }
                              return Text(title,
                                style: TextStyle(
                                    color: Color(0xFF282828),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                )
                              );
                            },
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                widget.onViewAll();
                              },
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              child: Text('View all')
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 64,
                      child: StreamBuilder<PageData<T>?>(
                        stream: _entitiesStreamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!;
                            if (data.data.isEmpty) {
                              return _buildNoEntitiesFound(); //return Text('Loaded');
                            } else {
                              return _buildEntitiesView(context, data.data);
                            }
                          } else {
                            return Center(
                                child: RefreshProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(Theme.of(tbContext.currentState!.context).colorScheme.primary),
                                )
                            );
                          }
                        }
                      ),
                    )
                  ],
                )
            )
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 10.0,
                offset: Offset(0, 4)
            ),
            BoxShadow(
                color: Colors.black.withAlpha(18),
                blurRadius: 30.0,
                offset: Offset(0, 10)
            ),
          ],
        )
    );
  }

  Widget _buildNoEntitiesFound() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFDEDEDE),
            style: BorderStyle.solid,
            width: 1
          ),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Center(
          child:
          Text(widget.noItemsFoundText,
            style: TextStyle(
              color: Color(0xFFAFAFAF),
              fontSize: 14,
            )
          ),
        ),
    );
  }

  Widget _buildEntitiesView(BuildContext context, List<T> entities) {
    return FadingEdgeScrollView.fromScrollView(
        gradientFractionOnStart: 0.2,
        gradientFractionOnEnd: 0.2,
        shouldDisposeScrollController: true,
        child: ListView(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            children: entities.map((entity) => EntityCard<T>(
                entity,
                entityCardWidgetBuilder: widget.buildEntityCard,
                onDetails: widget.onEntityDetails,
                briefView: true
            )).toList()
    ));
  }
}
