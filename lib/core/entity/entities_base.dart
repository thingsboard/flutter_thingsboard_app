import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

typedef EntityDetailsFunction<T extends BaseData> = Function(T entity);
typedef EntityCardWidgetBuilder<T extends BaseData> = Widget Function(BuildContext context, T entity, bool briefView);

mixin EntitiesBase<T extends BaseData> on HasTbContext {

  final entityDateFormat = DateFormat('yyyy-MM-dd');

  String get title;

  String get noItemsFoundText;

  Future<PageData<T>> fetchEntities(PageLink pageLink);

  Widget buildEntityCard(BuildContext context, T entity, bool briefView);

  void onEntityDetails(T entity);

}

class EntityCard<T extends BaseData> extends StatelessWidget {
  final bool _briefView;
  final T _entity;
  final EntityDetailsFunction<T>? _onDetails;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;

  EntityCard(T entity, {EntityDetailsFunction<T>? onDetails,
                        required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
                        required bool briefView}):
        this._entity = entity,
        this._onDetails = onDetails,
        this._entityCardWidgetBuilder = entityCardWidgetBuilder,
        this._briefView = briefView;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          child:
          Container(
            height: 64,
            margin: _briefView ? EdgeInsets.only(right: 8) : EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_briefView ? 4 : 6),
                ),
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: _entityCardWidgetBuilder(context, _entity, _briefView)
                )
            ),
            decoration: _briefView ? BoxDecoration(
                border: Border.all(
                    color: Color(0xFFDEDEDE),
                    style: BorderStyle.solid,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(4)
              ) : BoxDecoration(
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
            ),
          ),
          onTap: () {
            if (_onDetails != null) {
              _onDetails!(_entity);
            }
          }
      );
  }
}
