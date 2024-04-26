import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class SwitchEndpointParams {
  const SwitchEndpointParams({
    required this.data,
    required this.onDone,
    required this.onError,
  });

  final Map<String, dynamic> data;
  final VoidCallback onDone;
  final Function(String) onError;

  dynamic operator [](String key) => data[key];
}

class SwitchEndpointUseCase extends UseCase<void, SwitchEndpointParams> {
  SwitchEndpointUseCase({
    required this.repository,
    required this.logger,
  }) : _progressSteamCtrl = StreamController.broadcast();

  final INoAuthRepository repository;

  final TbLogger logger;
  late final StreamController<String> _progressSteamCtrl;

  Stream<String> get stream => _progressSteamCtrl.stream;

  @override
  Future<void> call(SwitchEndpointParams params) async {
    final uri = params['uri']!;
    final host = params['host'] ?? uri.origin;
    final key = params['secret']!;

    try {
      _progressSteamCtrl.add('Getting data from your host $host');
      final loginData = await repository.getJwtToken(host: host, key: key);
      _progressSteamCtrl.add('Logout you ...');

      await repository.logout(
        requestConfig: RequestConfig(ignoreErrors: true),
        notifyUser: false,
      );

      _progressSteamCtrl.add('Switching you to the new host $host');
      await repository.setUserFromJwtToken(loginData);

      logger.debug('SwitchEndpointUseCase:deleteFB App');
      await getIt<IFirebaseService>().removeApp();

      await getIt<IEndpointService>().setEndpoint(host);
      await repository.reInit(
        endpoint: host,
        onDone: params.onDone,
        onError: (error) {
          logger.error('SwitchEndpointUseCase:onError $error');
          params.onError(error.message ?? error.toString());
        },
      );
    } on ThingsboardError catch (e) {
      logger.error('SwitchEndpointUseCase:ThingsboardError $e', e);
      params.onError(e.message ?? e.toString());
    } catch (e) {
      logger.error('SwitchEndpointUseCase:catch $e', e);
      params.onError(e.toString());
    }
  }

  void dispose() {
    _progressSteamCtrl.close();
  }
}
