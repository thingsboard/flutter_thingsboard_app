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
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TbClientService implements ITbClientService {
  late ThingsboardClient _client;
  @override
  ThingsboardClient get client => _client;
  final IOverlayService _overlayService = getIt();

  // The client performs best-effort internal calls during init() (e.g. the
  // server version check hits /api/admin/updates, which answers 403 for
  // non-SYS_ADMIN users). Those must not surface as error toasts, and the
  // generated client library can't be modified to ignore them (PROD-8200).
  //
  // The client delivers error callbacks via Future(() => cb(error)), so an
  // error raised during init() reaches onClientError one event-loop turn AFTER
  // init() returns: the suppression has to outlive the call. ThingsboardError
  // carries no request path, so it can't be narrowed down to those calls - it
  // stays a time window, but a counted one, so that overlapping inits (a QR
  // endpoint switch started during an init) can't lift each other's window.
  static const _initErrorSuppression = Duration(seconds: 2);

  int _pendingInits = 0;

  // An unreachable server is never what the init-time 401/403 answers look
  // like: keep it visible even inside the suppression window.
  bool _shouldSuppress(ThingsboardError e) =>
      _pendingInits > 0 && !Utils.isConnectionError(e);

  Future<void> _initClient() async {
    _pendingInits++;
    try {
      await _client.init();
    } finally {
      Future.delayed(_initErrorSuppression, () => _pendingInits--);
    }
  }

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
      await _initClient();
    } catch (e) {
      log('Failed to init tbClient: $e');
      onInitError(e);
    }
  }

  void onUserLoaded() {
    log('onUser loaded: ${_client.getAuthUser()?.userId}');
    getIt<ICommunicationService>().fire(const UserLoadedEvent());
  }

  String _getMessage(dynamic e, BuildContext context) {
    final message =
        e is ThingsboardError
            ? (e.message ?? S.of(context).unknownError)
            : S.of(context).unknownError;

    return '${S.of(context).fatalApplicationErrorOccurred}\n$message';
  }

  void onInitError(dynamic e) {
    _overlayService.showAlertDialog(
      content:
          (context) => DialogContent(
            title: S.of(context).fatalError,
            message: _getMessage(e, context),
            ok: S.of(context).cancel,
          ),
    );
  }

  void onClientError(ThingsboardError e) {
    log('client on error: $e');
    if (_shouldSuppress(e)) {
      return;
    }
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
      _overlayService.showErrorNotification((_) => e.message!);
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
    log('TbClient:reinit() endpoint: $endpoint');
    _client = _createClient(
      endpoint,
      onError: (e) {
        onAuthError(e);
        onClientError(e);
      },
    );
    await _initClient();
    onDone();
  }
}
