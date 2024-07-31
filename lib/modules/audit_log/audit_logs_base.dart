import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/audit_log/audit_log_details_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

const Map<ActionType, String> actionTypeTranslations = {
  ActionType.ADDED: 'Added',
  ActionType.DELETED: 'Deleted',
  ActionType.UPDATED: 'Updated',
  ActionType.ATTRIBUTES_UPDATED: 'Attributes Updated',
  ActionType.ATTRIBUTES_DELETED: 'Attributes Deleted',
  ActionType.RPC_CALL: 'RPC Call',
  ActionType.CREDENTIALS_UPDATED: 'Credentials Updated',
  ActionType.ASSIGNED_TO_CUSTOMER: 'Assigned to Customer',
  ActionType.UNASSIGNED_FROM_CUSTOMER: 'Unassigned from Customer',
  ActionType.ACTIVATED: 'Activated',
  ActionType.SUSPENDED: 'Suspended',
  ActionType.CREDENTIALS_READ: 'Credentials read',
  ActionType.ATTRIBUTES_READ: 'Attributes read',
  ActionType.RELATION_ADD_OR_UPDATE: 'Relation updated',
  ActionType.RELATION_DELETED: 'Relation deleted',
  ActionType.RELATIONS_DELETED: 'All relation deleted',
  ActionType.ALARM_ACK: 'Acknowledged',
  ActionType.ALARM_CLEAR: 'Cleared',
  ActionType.ALARM_DELETE: 'Alarm Deleted',
  ActionType.ALARM_ASSIGNED: 'Alarm Assigned',
  ActionType.ALARM_UNASSIGNED: 'Alarm Unassigned',
  ActionType.LOGIN: 'Login',
  ActionType.LOGOUT: 'Logout',
  ActionType.LOCKOUT: 'Lockout',
  ActionType.ASSIGNED_FROM_TENANT: 'Assigned from Tenant',
  ActionType.ASSIGNED_TO_TENANT: 'Assigned to Tenant',
  ActionType.PROVISION_SUCCESS: 'Device provisioned',
  ActionType.PROVISION_FAILURE: 'Device provisioning was failed',
  ActionType.TIMESERIES_UPDATED: 'Telemetry updated',
  ActionType.TIMESERIES_DELETED: 'Telemetry deleted',
  ActionType.ASSIGNED_TO_EDGE: 'Assigned to Edge',
  ActionType.UNASSIGNED_FROM_EDGE: 'Unassigned from Edge',
  ActionType.ADDED_COMMENT: 'Added Comment',
  ActionType.UPDATED_COMMENT: 'Updated Comment',
  ActionType.DELETED_COMMENT: 'Deleted Comment',
  ActionType.SMS_SENT: 'SMS Sent',
};

const Map<ActionStatus, String> actionStatusTranslations = {
  ActionStatus.SUCCESS: 'Success',
  ActionStatus.FAILURE: 'Failure',
};

mixin AuditLogsBase on EntitiesBase<AuditLog, TimePageLink> {
  @override
  String get title => 'Audit Logs';

  @override
  String get noItemsFoundText => 'No audit logs found';

  @override
  Future<PageData<AuditLog>> fetchEntities(TimePageLink pageLink) {
    return tbClient.getAuditLogService().getAuditLogs(pageLink);
  }

  @override
  void onEntityTap(AuditLog auditLog) {}

  @override
  Widget buildEntityListCard(BuildContext context, AuditLog auditLog) {
    return _buildEntityListCard(context, auditLog);
  }

  Widget _buildEntityListCard(BuildContext context, AuditLog auditLog) {
    return AuditLogCard(tbContext, auditLog: auditLog);
  }
}

class AuditLogCard extends TbContextWidget {
  final AuditLog auditLog;

  AuditLogCard(TbContext tbContext, {super.key, required this.auditLog})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _AuditLogCardState();
}

class _AuditLogCardState extends TbContextState<AuditLogCard> {
  final entityDateFormat = DateFormat('yyyy-MM-dd');

  @override
  void didUpdateWidget(AuditLogCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: widget.auditLog.actionStatus == ActionStatus.SUCCESS
                    ? const Color(0xFF008A00)
                    : const Color(0xFFFF0000),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 4),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: AutoSizeText(
                                    widget.auditLog.entityName ?? '',
                                    maxLines: 2,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF282828),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 20 / 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  entityDateFormat.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      widget.auditLog.createdTime!,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    height: 16 / 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    entityTypeTranslations[
                                        widget.auditLog.entityId.entityType]!,
                                    style: const TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      height: 16 / 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  actionStatusTranslations[
                                      widget.auditLog.actionStatus]!,
                                  style: TextStyle(
                                    color: widget.auditLog.actionStatus ==
                                            ActionStatus.SUCCESS
                                        ? const Color(0xFF008A00)
                                        : const Color(0xFFFF0000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 16 / 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          actionTypeTranslations[widget.auditLog.actionType]!,
                          style: const TextStyle(
                            color: Color(0xFF282828),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            height: 20 / 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xffF0F4F9),
                        child: IconButton(
                          icon: const Icon(Icons.code, size: 18),
                          padding: const EdgeInsets.all(7.0),
                          onPressed: () => _auditLogDetails(widget.auditLog),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _auditLogDetails(AuditLog auditLog) {
    tbContext.showFullScreenDialog(AuditLogDetailsPage(tbContext, auditLog));
  }
}
