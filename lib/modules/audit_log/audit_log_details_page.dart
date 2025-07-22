import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AuditLogDetailsPage extends TbContextWidget {
  AuditLogDetailsPage(super.tbContext, this.auditLog, {super.key});
  final AuditLog auditLog;

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
        tbContext,
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
          children: [
            Text(S.of(context).entityType, style: labelTextStyle),
            Text(
             widget.auditLog.entityId.entityType.getTranslatedEntityType(context),
              style: valueTextStyle,
            ),
            const SizedBox(height: 16),
            Text(S.of(context).type, style: labelTextStyle),
            Text(
            widget.auditLog.actionType.getTranslatedActionType(context),
              style: valueTextStyle,
            ),
            const SizedBox(height: 16),
            Flexible(
              child: buildBorderedText(
                S.of(context).actionData,
                encoder.convert(widget.auditLog.actionData),
              ),
            ),
            if (widget.auditLog.actionStatus == ActionStatus.FAILURE)
              const SizedBox(height: 16),
            if (widget.auditLog.actionStatus == ActionStatus.FAILURE)
              Flexible(
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
            border: Border.all(color: const Color(0xFFDEDEDE)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: SingleChildScrollView(
            child: SelectableText(
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
