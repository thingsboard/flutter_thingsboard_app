import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AuditLogsList extends BaseEntitiesWidget<AuditLog, TimePageLink>
    with AuditLogsBase, EntitiesListStateBase {
  AuditLogsList(
      TbContext tbContext, PageKeyController<TimePageLink> pageKeyController,
      {searchMode = false})
      : super(tbContext, pageKeyController, searchMode: searchMode);
}
