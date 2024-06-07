import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'alarms_list.dart';

class AlarmsPage extends TbContextWidget {
  final bool searchMode;
  final bool filterMode;

  AlarmsPage(
    TbContext tbContext, {
    super.key,
    this.searchMode = false,
    this.filterMode = false,
  }) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends TbContextState<AlarmsPage>
    with AutomaticKeepAliveClientMixin<AlarmsPage> {
  final _alarmQueryController = AlarmQueryController();

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final alarmsList = AlarmsList(
      tbContext,
      _alarmQueryController,
      searchMode: widget.searchMode,
    );

    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) =>
            _alarmQueryController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(
        tbContext,
        title: Text(alarmsList.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              navigateTo('/alarms?filter=true');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              navigateTo('/alarms?search=true');
            },
          ),
        ],
      );
    }

    return Scaffold(appBar: appBar, body: alarmsList);
  }

  @override
  void dispose() {
    _alarmQueryController.dispose();
    super.dispose();
  }
}
