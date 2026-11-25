// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(this.logger);

  final TbLogger logger;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.info('AppBlocObserver::onCreate(${bloc.runtimeType})');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.info('AppBlocObserver::onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.info(
      'AppBlocObserver::onError(${bloc.runtimeType}, $error, $stackTrace)',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.info('AppBlocObserver::onClose(${bloc.runtimeType})');
  }
}
