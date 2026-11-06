// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';

class EntityListCard<T> extends StatelessWidget {
  const EntityListCard(
    T entity, {
    super.key,
    this._onEntityTap,
    required this._entityCardWidgetBuilder,
    this._listWidgetCard = false,
  }) : _entity = entity;
  final bool _listWidgetCard;
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: _listWidgetCard
            ? const EdgeInsets.only(right: 8)
            : EdgeInsets.zero,
        decoration: _listWidgetCard
            ? BoxDecoration(
                border: Border.all(color: const Color(0xFFDEDEDE)),
                borderRadius: BorderRadius.circular(4),
              )
            : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((255 * 0.05).ceil()),
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
