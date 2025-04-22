import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart' show getIt;
import 'package:thingsboard_app/services/communication/i_communication_service.dart'
    show GlobalLogoutEvent, ICommunicationService;
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';

class LegacyService implements ILegacyService {
  LegacyService() {
    subscription = communicationService.on<GlobalLogoutEvent>().listen((_) {
      _tbContext.logout(notifyUser: false);
    });
  }

  late TbContext _tbContext;
  final communicationService = getIt<ICommunicationService>();
  late final StreamSubscription subscription;

  @override
  Future<void> initTbContext() async {
    _tbContext = TbContext(FluroRouter.appRouter);
    return _tbContext.init();
  }

  @override
  TbContext get tbContext => _tbContext;

  @override
  Future<void> dispose() async {
    subscription.cancel();
  }
}
