import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/fb_options2.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class SwitchEndpointUseCase extends UseCase<void, SwitchEndpointParams> {
  SwitchEndpointUseCase({
    required this.repository,
    required this.tbContext,
  }) : _progressSteamCtrl = StreamController.broadcast();

  final INoAuthRepository repository;
  final TbContext tbContext;
  late final StreamController<String> _progressSteamCtrl;

  Stream<String> get stream => _progressSteamCtrl.stream;

  @override
  Future<void> call(SwitchEndpointParams params) async {
    final uri = params['uri']!;
    final host = params['host'] ?? uri.origin;
    final key = params['secret']!;

    _progressSteamCtrl.add('Getting data from your host $host');

    final loginData = await repository.getJwtToken(host: host, key: key);
    try {
      _progressSteamCtrl.add('Logout you ...');

      await tbContext.logout(
        requestConfig: RequestConfig(ignoreErrors: true),
        notifyUser: false,
      );

      _progressSteamCtrl.add('Switching you to the new host $host');
      await repository.setUserFromJwtToken(loginData);

      await Firebase.initializeApp(
        name: 'secondary',
        options: DefaultFirebaseOptions.currentPlatform,
      );

      tbContext.log.debug('SwitchEndpointUseCase:deleteFB App');
      await Firebase.app('initial').delete();

      await tbContext.reInit(
        endpoint: host,
        onDone: params.onDone,
        onError: (error) {
          tbContext.log.error('SwitchEndpointUseCase:onError $error');
          _progressSteamCtrl.add('Somethings went wrong ... Rollback');
          tbContext.pop();
        },
      );
    } catch (e) {
      tbContext.log.error('SwitchEndpointUseCase:catch $e');
      _progressSteamCtrl.add('Somethings went wrong ... Rollback');
      tbContext.pop();
    }
  }

  void dispose() {
    _progressSteamCtrl.close();
  }
}

final class SwitchEndpointParams {
  const SwitchEndpointParams({required this.data, required this.onDone});

  final Map<String, dynamic> data;
  final VoidCallback onDone;

  dynamic operator [](String key) => data[key];
}
