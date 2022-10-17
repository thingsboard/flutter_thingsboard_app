import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/audit_log/audit_log_details_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../generated/l10n.dart';

Map<ActionType, String> actionTypeTranslations = {
  ActionType.ADDED: S.current.audit_log_type_added,
  ActionType.DELETED: S.current.audit_log_type_deleted,
  ActionType.UPDATED: S.current.audit_log_type_updated,
  ActionType.ATTRIBUTES_DELETED: S.current.audit_log_type_attributes_deleted,
  ActionType.ATTRIBUTES_UPDATED: S.current.audit_log_type_attributes_updated,
  ActionType.RPC_CALL: S.current.audit_log_type_rpc_call,
  ActionType.CREDENTIALS_UPDATED: S.current.audit_log_type_credentials_updated,
  ActionType.ASSIGNED_TO_CUSTOMER: S.current.audit_log_type_assigned_to_customer,
  ActionType.UNASSIGNED_FROM_CUSTOMER: S.current.audit_log_type_unassigned_from_customer,
  ActionType.ACTIVATED: S.current.audit_log_type_activated,
  ActionType.SUSPENDED: S.current.audit_log_type_suspended,
  ActionType.CREDENTIALS_READ: S.current.audit_log_type_credentials_read,
  ActionType.ATTRIBUTES_READ: S.current.audit_log_type_attributes_read,
  ActionType.RELATION_ADD_OR_UPDATE: S.current.audit_log_type_relation_add_or_update,
  ActionType.RELATION_DELETED: S.current.audit_log_type_relation_deleted,
  ActionType.RELATIONS_DELETED: S.current.audit_log_type_relations_deleted,
  ActionType.ALARM_ACK: S.current.audit_log_type_alarm_ack,
  ActionType.ALARM_CLEAR: S.current.audit_log_type_alarm_clear,
  ActionType.LOGIN: S.current.audit_log_type_login,
  ActionType.LOGOUT: S.current.audit_log_type_logout,
  ActionType.LOCKOUT: S.current.audit_log_type_lockout,
  ActionType.ASSIGNED_FROM_TENANT: S.current.audit_log_type_assigned_from_tenant,
  ActionType.ASSIGNED_TO_TENANT: S.current.audit_log_type_assigned_to_tenant,
  ActionType.PROVISION_SUCCESS: S.current.audit_log_type_provision_success,
  ActionType.PROVISION_FAILURE: S.current.audit_log_type_provision_failure,
  ActionType.TIMESERIES_UPDATED: S.current.audit_log_type_timeseries_updated,
  ActionType.TIMESERIES_DELETED: S.current.audit_log_type_timeseries_deleted,
  ActionType.ASSIGNED_TO_EDGE: S.current.audit_log_type_assigned_to_edge,
  ActionType.UNASSIGNED_FROM_EDGE: S.current.audit_log_type_unassigned_from_edge,
};

Map<ActionStatus, String> actionStatusTranslations = {
  ActionStatus.SUCCESS: S.current.audit_log_status_success,
  ActionStatus.FAILURE: S.current.audit_log_status_failure
};

mixin AuditLogsBase on EntitiesBase<AuditLog, TimePageLink> {
  @override
  String get title => S.current.audit_logs_title;

  @override
  String get noItemsFoundText => S.current.audit_logs_not_found;

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

  AuditLogCard(TbContext tbContext, {required this.auditLog})
      : super(tbContext);

  @override
  _AuditLogCardState createState() => _AuditLogCardState();
}

class _AuditLogCardState extends TbContextState<AuditLogCard> {
  final entityDateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
  }

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
                      color:
                          widget.auditLog.actionStatus == ActionStatus.SUCCESS
                              ? Color(0xFF008A00)
                              : Color(0xFFFF0000),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                ))),
        Row(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(width: 4),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 16),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            fit: FlexFit.tight,
                                            child: AutoSizeText(
                                                widget.auditLog.entityName ??
                                                    '',
                                                maxLines: 2,
                                                minFontSize: 8,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF282828),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    height: 20 / 14))),
                                        Text(
                                            entityDateFormat.format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    widget.auditLog
                                                        .createdTime!)),
                                            style: TextStyle(
                                                color: Color(0xFFAFAFAF),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                height: 16 / 12))
                                      ]),
                                  SizedBox(height: 4),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            fit: FlexFit.tight,
                                            child: Text(
                                                entityTypeTranslations[widget
                                                    .auditLog
                                                    .entityId
                                                    .entityType]!,
                                                style: TextStyle(
                                                    color: Color(0xFFAFAFAF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12,
                                                    height: 16 / 12))),
                                        Text(
                                            actionStatusTranslations[
                                                widget.auditLog.actionStatus]!,
                                            style: TextStyle(
                                                color: widget.auditLog
                                                            .actionStatus ==
                                                        ActionStatus.SUCCESS
                                                    ? Color(0xFF008A00)
                                                    : Color(0xFFFF0000),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                height: 16 / 12))
                                      ]),
                                  SizedBox(height: 12)
                                ],
                              )),
                          SizedBox(width: 16)
                        ]),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 16),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                                actionTypeTranslations[
                                    widget.auditLog.actionType]!,
                                style: TextStyle(
                                    color: Color(0xFF282828),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    height: 20 / 14))),
                        SizedBox(height: 32),
                        CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xffF0F4F9),
                            child: IconButton(
                                icon: Icon(Icons.code, size: 18),
                                padding: EdgeInsets.all(7.0),
                                onPressed: () =>
                                    _auditLogDetails(widget.auditLog))),
                        SizedBox(width: 8)
                      ],
                    ),
                    SizedBox(height: 8)
                  ]))
        ])
      ],
    );
  }

  _auditLogDetails(AuditLog auditLog) {
    tbContext
        .showFullScreenDialog(new AuditLogDetailsPage(tbContext, auditLog));
  }
}
