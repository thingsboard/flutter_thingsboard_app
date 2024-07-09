import 'package:flutter/material.dart';

import 'entities_base.dart';

class EntityGridCard<T> extends StatelessWidget {
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;
  final EntityCardSettings _settings;

  const EntityGridCard(
    T entity, {
    Key? key,
    EntityTapFunction<T>? onEntityTap,
    required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
    required EntityCardSettings settings,
  })  : _entity = entity,
        _onEntityTap = onEntityTap,
        _entityCardWidgetBuilder = entityCardWidgetBuilder,
        _settings = settings,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: _settings.dropShadow
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((255 * 0.05).ceil()),
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
          child: _entityCardWidgetBuilder(context, _entity),
        ),
      ),
      onTap: () {
        if (_onEntityTap != null) {
          _onEntityTap(_entity);
        }
      },
    );
  }
}
