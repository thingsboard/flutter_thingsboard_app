import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/audit_log/audit_log_details_page.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';

mixin AuditLogsBase on EntitiesBase<AuditLog, TimePageLink> {
  @override
  String get title => 'Audit Logs';

  @override
  String get noItemsFoundText => 'No audit logs found';

  @override
  Future<PageData<AuditLog>> fetchEntities(TimePageLink pageLink, {bool refresh = false}) {
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

  AuditLogCard(super.tbContext, {super.key, required this.auditLog});
  final AuditLog auditLog;

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
          children: [
            const SizedBox(width: 4),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Row(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                 
                                  child: Text(
                                    widget.auditLog.entityName ?? '',
                                    maxLines: 2,
                                   // minFontSize: 8,
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
                                        widget.auditLog.entityId.entityType.getTranslatedEntityType(context),
                                    style: const TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      height: 16 / 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  
                                      widget.auditLog.actionStatus.getTranslatedActionStatus(context),
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
                    children: [
                      const SizedBox(width: 16),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                         widget.auditLog.actionType.getTranslatedActionType(context),
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

 void _auditLogDetails(AuditLog auditLog) {
    tbContext.showFullScreenDialog(AuditLogDetailsPage(tbContext, auditLog));
  }
}
