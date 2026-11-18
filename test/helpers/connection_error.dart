// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// What a client API throws when the server cannot be reached: the client's
/// interceptor wraps the converted error in a new [DioException].
DioException unreachableServer({
  DioExceptionType type = DioExceptionType.connectionError,
}) => DioException(
  requestOptions: RequestOptions(),
  error: toThingsboardError(
    DioException(requestOptions: RequestOptions(), type: type),
  ),
);

/// [unreachableServer] as the app sees it after [toThingsboardError].
ThingsboardError connectionError({
  DioExceptionType type = DioExceptionType.connectionError,
}) => toThingsboardError(unreachableServer(type: type));
