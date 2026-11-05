// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_client/thingsboard_client.dart' show AuditLog, apiSerializers, registerAuditLog;

/// Serializes the objects the app passes as GoRouter `extra`.
///
/// GoRouter keeps the current route in serialized form and re-parses it every
/// time its `refreshListenable` fires, which `RefreshListenable` does on every
/// orientation change via `navigationProvider`. Without a codec that re-parse
/// turns an `extra` object into a plain `Map` (or drops it), and the route
/// builders' casts throw. Every type a route reads from `state.extra` must be
/// handled here.
class RouteExtraCodec extends Codec<Object?, Object?> {
  const RouteExtraCodec();

  @override
  Converter<Object?, Object?> get encoder => const _RouteExtraEncoder();

  @override
  Converter<Object?, Object?> get decoder => const _RouteExtraDecoder();
}

const _typeKey = 'type';
const _dataKey = 'data';
const _dashboardArgumentsType = 'DashboardArgumentsEntity';
const _auditLogType = 'AuditLog';

/// Registers only [AuditLog] and the models it contains: the full
/// `standardSerializers` would keep every generated model in the build.
final _auditLogSerializers = apiSerializers(registerAuditLog);

class _RouteExtraEncoder extends Converter<Object?, Object?> {
  const _RouteExtraEncoder();

  @override
  Object? convert(Object? input) {
    return switch (input) {
      null => null,
      DashboardArgumentsEntity() => _tagged(
        _dashboardArgumentsType,
        jsonEncode(input.toJson()),
      ),
      AuditLog() => _tagged(
        _auditLogType,
        _auditLogSerializers.toJson(AuditLog.serializer, input),
      ),
      _ => _dropUnsupported(input),
    };
  }

  Map<String, String> _tagged(String type, String json) => {
    _typeKey: type,
    _dataKey: json,
  };

  Object? _dropUnsupported(Object input) {
    log(
      'RouteExtraCodec: dropping extra of unsupported type '
      '${input.runtimeType}; add it to the codec if a route reads it.',
    );
    return null;
  }
}

class _RouteExtraDecoder extends Converter<Object?, Object?> {
  const _RouteExtraDecoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    final encoded = input as Map<Object?, Object?>;
    final json = encoded[_dataKey]! as String;
    return switch (encoded[_typeKey]) {
      _dashboardArgumentsType => DashboardArgumentsEntity.fromJson(
        jsonDecode(json) as Map<String, dynamic>,
      ),
      _auditLogType => _auditLogSerializers.fromJson(AuditLog.serializer, json),
      final type => throw FormatException('Unknown route extra type: $type'),
    };
  }
}
