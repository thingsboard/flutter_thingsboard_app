import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_loaded_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TbClientService implements ITbClientService {
  late ThingsboardClient _client;
  @override
  ThingsboardClient get client => _client;
  final IOverlayService _overlayService = getIt();

  ThingsboardClient _createClient(
    String endpoint, {
    required ErrorCallback onError,
  }) {
    return ThingsboardClient(
      endpoint,
      storage: getIt(),
      onUserLoaded: onUserLoaded,
      onError: onError,
      onLoadStarted: onLoadStarted,
      onLoadFinished: onLoadFinished,
      computeFunc: <Q, R>(callback, message) => compute(callback, message),
    );
  }

  @override
  Future<void> init() async {
    final endpoint = await getIt<IEndpointService>().getEndpoint();
    log('TbClient::init() endpoint: $endpoint');

    _client = _createClient(endpoint, onError: onClientError);

    try {
      await _client.init();
    } catch (e) {
      log('Failed to init tbClient: $e');
      onInitError(e);
    }
  }

  void onUserLoaded() {
    log('onUser loaded: ${_client.getAuthUser()?.userId}');
    getIt<ICommunicationService>().fire(const UserLoadedEvent());
  }

  void onInitError(dynamic e) {
    _overlayService.showAlertDialog(
      content: (context) => fatalErrorDialogContent(context, e),
    );
  }

  void onClientError(ThingsboardError e) {
    log('client on error: $e');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Utils.isConnectionError(e)) {
        _overlayService.showAlertDialog(
          content:
              (context) => DialogContent(
                title: S.of(context).connectionError,
                message: S.of(context).failedToConnectToServer,
              ),
        );

        return;
      }
      _overlayService.showErrorNotification(e.getTranslatedMessage);
    });
  }

  static void onLoadFinished() {
    getIt<ILoadingService>().isLoading.value = false;
    log('client on load finish');
  }

  static void onLoadStarted() {
    getIt<ILoadingService>().isLoading.value = true;
    log('client on load');
  }

  @override
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  }) async {
    log('TbClient:reinit()');
    _client = _createClient(
      endpoint,
      onError: (e) {
        onAuthError(e);
        onClientError(e);
      },
    );
    await _client.init();
    onDone();
  }
}
