import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/usecase.dart';

final class SwitchEndpointParams {
  const SwitchEndpointParams({
    required this.data,
    required this.onDone,
    required this.onError,
  });

  final SwitchEndpointArgs data;
  final VoidCallback onDone;
  final Function(String?) onError;
}

class SwitchEndpointUseCase extends UseCase<void, SwitchEndpointParams> {
  SwitchEndpointUseCase({required this.repository, required this.logger})
    : _progressSteamCtrl = StreamController.broadcast();

  final INoAuthRepository repository;

  final TbLogger logger;
  late final StreamController<String> _progressSteamCtrl;

  Stream<String> get stream => _progressSteamCtrl.stream;

  @override
  Future<void> call(SwitchEndpointParams params) async {
    final uri = params.data.uri;
    final host =  params.data.host ?? uri.origin;
    final key = params.data.secret;
    final currentEndpoint = await getIt<IEndpointService>().getEndpoint();
    final isTheSameHost =
        Uri.parse(host).host.compareTo(Uri.parse(currentEndpoint).host) == 0;

    try {
      _progressSteamCtrl.add('Getting data from your host $host');
      final loginData = await repository.getJwtToken(host: host, key: key);

      final authUserFromJwt = repository.getAuthUserFromJwt(loginData.token);
      final currentlyAuthUser =
          repository.getCurrentlyAuthenticatedUserOrNull();
      if (authUserFromJwt.userId == currentlyAuthUser?.userId) {
        params.onDone();
        return;
      }

      if (repository.isAuthenticated()) {
        _progressSteamCtrl.add('Logout you ...');
        await repository.logout(
          requestConfig: RequestConfig(ignoreErrors: true),
          notifyUser: false,
        );
      }

      if (isTheSameHost) {
        _progressSteamCtrl.add('Logging you into the host $host');
      } else {
        _progressSteamCtrl.add('Switching you to the new host $host');
      }

      await repository.setUserFromJwtToken(loginData);
      await getIt<IEndpointService>().setEndpoint(host);

      if (!isTheSameHost) {
        logger.debug('SwitchEndpointUseCase:deleteFB App');
        if (Firebase.apps.isNotEmpty) {
          getIt<IFirebaseService>()
            ..removeApp()
            ..removeApp(name: currentEndpoint);
        }

        // If we revert to the original host configured in the app_constants
        final t = await getIt<IEndpointService>().isCustomEndpoint();
        logger.debug(t);
        if (!t) {
          await _initDefaultFbApp();
        }
      }

      // A re-initialization is required if we set 'notifyUser' to true for
      // 'setUserFromJwtToken'. This code will be executed twice.
      await repository.reInit(
        endpoint: host,
        onDone: params.onDone,
        onError: (error) {
          logger.error('SwitchEndpointUseCase:onError $error');
          params.onError(error.message);
        },
      );
    } catch (e) {
      await reset(params);
      if (e is ThingsboardError) {
        logger.error('SwitchEndpointUseCase:ThingsboardError $e', e);
        params.onError(e.message ?? e.toString());
        return;
      }
      logger.error('SwitchEndpointUseCase:catch $e', e);
      params.onError(e.toString());
    }
  }

  Future<void> _initDefaultFbApp() async {
       try {
        await getIt<IFirebaseService>().initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    } catch (e) {
      //Ignore this error if fcm is not configured
      if (e is! UnsupportedError) {
        rethrow;
      }
    }
  }

  Future<void> reset(SwitchEndpointParams params) async {
    try {
      await getIt<IEndpointService>().setEndpoint(
        ThingsboardAppConstants.thingsBoardApiEndpoint,
      );
      await getIt<IFirebaseService>().clearApps();
       await _initDefaultFbApp();
      await repository.reInit(
        endpoint: ThingsboardAppConstants.thingsBoardApiEndpoint,
        onDone: params.onDone,
        onError: (error) {
          logger.error('SwitchEndpointUseCase:onError $error');
          params.onError(error.message);
        },
      );
    } catch (e) {
      logger.error('SwitchEndpointUseCaseReset:onError $e');
    }
  }

  void dispose() {
    _progressSteamCtrl.close();
  }
}
