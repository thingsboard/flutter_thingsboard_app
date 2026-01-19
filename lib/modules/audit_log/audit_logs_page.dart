import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_app_search_bar.dart';

class AuditLogsPage extends StatefulWidget {
  const AuditLogsPage({this.searchMode = false, super.key});
  final bool searchMode;

  @override
  State<StatefulWidget> createState() => _AuditLogsPageState();
}

class _AuditLogsPageState extends State<AuditLogsPage> {
  final TimePageLinkController _timePageLinkController =
      TimePageLinkController();

  @override
  Widget build(BuildContext context) {
    final auditLogsList = AuditLogsList(
      _timePageLinkController,
      searchMode: widget.searchMode,
    );
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        onSearch:
            (searchText) => _timePageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(
        title: Text(auditLogsList.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // translate-me-ignore-next-line
              getIt<ThingsboardAppRouter>().navigateTo(
                '/auditLogs?search=true',
              );
            },
          ),
        ],
      );
    }
    return Scaffold(appBar: appBar, body: auditLogsList);
  }

  @override
  void dispose() {
    _timePageLinkController.dispose();
    super.dispose();
  }
}
