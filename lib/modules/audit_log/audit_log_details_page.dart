import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AuditLogDetailsPage extends TbContextWidget {
  final AuditLog auditLog;

  AuditLogDetailsPage(TbContext tbContext, this.auditLog, {super.key})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _AuditLogDetailsPageState();
}

class _AuditLogDetailsPageState extends TbContextState<AuditLogDetailsPage> {
  final labelTextStyle =
      const TextStyle(color: Color(0xFF757575), fontSize: 14, height: 20 / 14);

  final valueTextStyle =
      const TextStyle(color: Color(0xFF282828), fontSize: 14, height: 20 / 14);

  final encoder = const JsonEncoder.withIndent('  ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.auditLog.entityName != null)
              Text(
                widget.auditLog.entityName!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 20 / 16,
                ),
              ),
            Text(
              S.of(context).auditLogDetails,
              style: TextStyle(
                color: Theme.of(context)
                    .primaryTextTheme
                    .titleLarge!
                    .color!
                    .withAlpha((0.38 * 255).ceil()),
                fontSize: 12,
                fontWeight: FontWeight.normal,
                height: 16 / 12,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(S.of(context).entityType, style: labelTextStyle),
            Text(
              entityTypeTranslations[widget.auditLog.entityId.entityType]!,
              style: valueTextStyle,
            ),
            const SizedBox(height: 16),
            Text(S.of(context).type, style: labelTextStyle),
            Text(
              actionTypeTranslations[widget.auditLog.actionType]!,
              style: valueTextStyle,
            ),
            const SizedBox(height: 16),
            Flexible(
              fit: FlexFit.loose,
              child: buildBorderedText(
                S.of(context).actionData,
                encoder.convert(widget.auditLog.actionData),
              ),
            ),
            if (widget.auditLog.actionStatus == ActionStatus.FAILURE)
              const SizedBox(height: 16),
            if (widget.auditLog.actionStatus == ActionStatus.FAILURE)
              Flexible(
                fit: FlexFit.loose,
                child: buildBorderedText(
                  S.of(context).failureDetails,
                  widget.auditLog.actionFailureDetails!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildBorderedText(String title, String content) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 18, 48, 18),
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFDEDEDE), width: 1),
            borderRadius: BorderRadius.circular(4),
            shape: BoxShape.rectangle,
          ),
          child: SingleChildScrollView(
            child: Text(
              content,
              style: const TextStyle(
                color: Color(0xFF282828),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 4, right: 4),
            color: Colors.white,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF757575),
                fontSize: 12,
                height: 14 / 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
