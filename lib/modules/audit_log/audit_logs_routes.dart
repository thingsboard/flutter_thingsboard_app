import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_page.dart';

class AuditLogsRoutes extends TbRoutes {
  AuditLogsRoutes(super.tbContext);
  late final auditLogsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final searchMode = params['search']?.first == 'true';
      return AuditLogsPage(tbContext, searchMode: searchMode);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/auditLogs', handler: auditLogsHandler);
  }
}
