import 'package:flutter/material.dart';

import 'entities_base.dart';

class EntityListCard<T> extends StatelessWidget {
  final bool _listWidgetCard;
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;

  EntityListCard(T entity,
      {Key? key,
      EntityTapFunction<T>? onEntityTap,
      required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
      bool listWidgetCard = false})
      : this._entity = entity,
        this._onEntityTap = onEntityTap,
        this._entityCardWidgetBuilder = entityCardWidgetBuilder,
        this._listWidgetCard = listWidgetCard,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          margin: _listWidgetCard ? EdgeInsets.only(right: 8) : EdgeInsets.zero,
          child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 0,
              child: _entityCardWidgetBuilder(context, _entity)),
          decoration: _listWidgetCard
              ? BoxDecoration(
                  border: Border.all(
                      color: Color(0xFFDEDEDE),
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(4))
              : BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha((255 * 0.05).ceil()),
                        blurRadius: 6.0,
                        offset: Offset(0, 4)),
                  ],
                ),
        ),
        onTap: () {
          if (_onEntityTap != null) {
            _onEntityTap!(_entity);
          }
        });
  }
}
