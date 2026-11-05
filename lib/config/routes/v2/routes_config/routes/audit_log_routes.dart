import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/audit_log/audit_log_details_page.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AuditLogRoutes {
  static const auditLogs = '/auditLogs';
  static const auditLogDetais = '/auditLogDetails';
}

// Audit log routes
final auditLogRoutes = [
  GoRoute(
    path: AuditLogRoutes.auditLogs,
    builder: (context, state) {
      final searchMode = state.uri.queryParameters['search'] == 'true';

      return AuditLogsPage(searchMode: searchMode);
    },
  ),
  GoRoute(path: AuditLogRoutes.auditLogDetais,
  builder: (context, state) => AuditLogDetailsPage(state.extra! as AuditLog),
  ),
];
