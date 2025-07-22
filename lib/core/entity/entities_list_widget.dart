import 'dart:async';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entity_list_card.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class EntitiesListWidgetController {
  final states = <_EntitiesListWidgetState>[];

  void _registerEntitiesWidgetState(
    _EntitiesListWidgetState entitiesListWidgetState,
  ) {
    states.add(entitiesListWidgetState);
  }

  void _unregisterEntitiesWidgetState(
    _EntitiesListWidgetState entitiesListWidgetState,
  ) {
    states.remove(entitiesListWidgetState);
  }

  Future<void> refresh() {
    return Future.wait(states.map((state) => state._refresh()));
  }

  void dispose() {
    states.clear();
  }
}

abstract class EntitiesListPageLinkWidget<T>
    extends EntitiesListWidget<T, PageLink> {
  EntitiesListPageLinkWidget(
    super.tbContext, {
    super.controller,
    super.key,
  });

  @override
  PageKeyController<PageLink> createPageKeyController() =>
      PageLinkController(pageSize: 5);
}

abstract class EntitiesListWidget<T, P> extends TbContextWidget
    with EntitiesBase<T, P> {

  EntitiesListWidget(
    super.tbContext, {
    super.key,
    EntitiesListWidgetController? controller,
  })  : _controller = controller;
  final EntitiesListWidgetController? _controller;

  @override
  State<StatefulWidget> createState() => _EntitiesListWidgetState();

  PageKeyController<P> createPageKeyController();

  void onViewAll();
}

class _EntitiesListWidgetState<T, P>
    extends TbContextState<EntitiesListWidget<T, P>> {
  late final PageKeyController<P> _pageKeyController;

  final StreamController<PageData<T>?> _entitiesStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pageKeyController = widget.createPageKeyController();
    widget._controller?._registerEntitiesWidgetState(this);

    _refresh();
  }

  @override
  void dispose() {
    widget._controller?._unregisterEntitiesWidgetState(this);
    _pageKeyController.dispose();
    _entitiesStreamController.close();
    super.dispose();
  }

  Future<void> _refresh() {
    _entitiesStreamController.add(null);
    final entitiesFuture = widget.fetchEntities(_pageKeyController.value.pageKey);
    entitiesFuture.then((value) => _entitiesStreamController.add(value));
    return entitiesFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 30.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
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
                          final data = snapshot.data;
                          title += ' (${data!.totalElements})';
                        }
                        return Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF282828),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        widget.onViewAll();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child:  Text(S.of(context).viewAll),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 64,
                child: StreamBuilder<PageData<T>?>(
                  stream: _entitiesStreamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      if (data.data.isEmpty) {
                        return _buildNoEntitiesFound(); //return Text('Loaded');
                      } else {
                        return _buildEntitiesView(context, data.data);
                      }
                    } else {
                      return Center(
                        child: RefreshProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Theme.of(tbContext.currentState!.context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoEntitiesFound() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDEDEDE),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          widget.noItemsFoundText,
          style: const TextStyle(
            color: Color(0xFFAFAFAF),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildEntitiesView(BuildContext context, List<T> entities) {
    return FadingEdgeScrollView.fromScrollView(
      gradientFractionOnStart: 0.2,
      gradientFractionOnEnd: 0.2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        children: entities
            .map(
              (entity) => EntityListCard<T>(
                entity,
                entityCardWidgetBuilder: widget.buildEntityListWidgetCard,
                onEntityTap: widget.onEntityTap,
                listWidgetCard: true,
              ),
            )
            .toList(),
      ),
    );
  }
}
