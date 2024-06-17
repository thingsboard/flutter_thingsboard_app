import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/di/alarms_di.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_assignee_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_control_filters_button.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_types_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/filter_toggle_block_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmsFilterPage extends TbContextWidget {
  AlarmsFilterPage(this.tbContext, {super.key}) : super(tbContext);

  @override
  final TbContext tbContext;

  @override
  State<StatefulWidget> createState() => _AlarmsFilterPageState();
}

class _AlarmsFilterPageState extends TbContextState<AlarmsFilterPage> {
  final list = const [
    FilterDataEntity(label: 'Active', data: AlarmSearchStatus.ACTIVE),
    FilterDataEntity(label: 'Cleared', data: AlarmSearchStatus.CLEARED),
    FilterDataEntity(label: 'Acknowledged', data: AlarmSearchStatus.ACK),
    FilterDataEntity(label: 'Unacknowledged', data: AlarmSearchStatus.UNACK),
  ];

  final list2 = const [
    FilterDataEntity(label: 'Critical', data: AlarmSeverity.CRITICAL),
    FilterDataEntity(label: 'Major', data: AlarmSeverity.MAJOR),
    FilterDataEntity(label: 'Minor', data: AlarmSeverity.MINOR),
    FilterDataEntity(label: 'Warning', data: AlarmSeverity.WARNING),
    FilterDataEntity(label: 'Indeterminate', data: AlarmSeverity.INDETERMINATE),
  ];

  final diScopeKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlarmTypesBloc>.value(value: getIt()),
        BlocProvider<AssigneeBloc>.value(value: getIt()),
      ],
      child: Scaffold(
        appBar: TbAppBar(
          tbContext,
          title: const Text('Filters'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterToggleBlockWidget(
                        label: 'Alarm status list',
                        items: list,
                        selected: const {0},
                        onSelectedChanged: (values) {},
                        labelAtIndex: (index) => list[index].label,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: FilterToggleBlockWidget(
                          label: 'Alarm severity list',
                          items: list2,
                          onSelectedChanged: (values) {},
                          labelAtIndex: (index) => list2[index].label,
                        ),
                      ),
                      AlarmTypesWidget(tbContext: tbContext),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AlarmAssigneeFilter(tbContext: tbContext),
                      ),
                    ],
                  ),
                  const AlarmControlFiltersButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    AlarmsDi.init(diScopeKey.toString(), tbClient: widget.tbContext.tbClient);
    super.initState();
  }

  @override
  void dispose() {
    AlarmsDi.dispose(diScopeKey.toString());
    super.dispose();
  }
}
