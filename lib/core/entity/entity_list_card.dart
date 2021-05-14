
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'entities_base.dart';

class EntityListCard<T> extends StatelessWidget {
  final bool _listWidgetCard;
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;
  final EntityCardSettings _settings;

  EntityListCard(T entity, {EntityTapFunction<T>? onEntityTap,
    required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
    required EntityCardSettings settings,
    bool listWidgetCard = false}):
        this._entity = entity,
        this._onEntityTap = onEntityTap,
        this._entityCardWidgetBuilder = entityCardWidgetBuilder,
        this._settings = settings,
        this._listWidgetCard = listWidgetCard;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          child:
          Container(
            margin: _listWidgetCard ? EdgeInsets.only(right: 8) : EdgeInsets.zero,
            child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_listWidgetCard ? 4 : 6),
                ),
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: _entityCardWidgetBuilder(context, _entity)
                )
            ),
            decoration: _listWidgetCard ? BoxDecoration(
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
            if (_onEntityTap != null) {
              _onEntityTap!(_entity);
            }
          }
      );
  }
}

