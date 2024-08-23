import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_control_filters_button.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_types/alarm_types_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/alarm_assignee_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/filter_toggle_block_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AlarmsFilterPage extends TbContextWidget {
  AlarmsFilterPage(
    this.tbContext, {
    required this.pageController,
    super.key,
  }) : super(tbContext);

  @override
  final TbContext tbContext;
  final PreloadPageController pageController;

  @override
  State<StatefulWidget> createState() => _AlarmsFilterPageState();
}

class _AlarmsFilterPageState extends TbContextState<AlarmsFilterPage> {
  final alarmStatus = const <FilterDataEntity>[
    FilterDataEntity(label: 'Active', data: AlarmSearchStatus.ACTIVE),
    FilterDataEntity(label: 'Cleared', data: AlarmSearchStatus.CLEARED),
    FilterDataEntity(label: 'Acknowledged', data: AlarmSearchStatus.ACK),
    FilterDataEntity(label: 'Unacknowledged', data: AlarmSearchStatus.UNACK),
  ];

  final alarmSeverity = const [
    FilterDataEntity(label: 'Critical', data: AlarmSeverity.CRITICAL),
    FilterDataEntity(label: 'Major', data: AlarmSeverity.MAJOR),
    FilterDataEntity(label: 'Minor', data: AlarmSeverity.MINOR),
    FilterDataEntity(label: 'Warning', data: AlarmSeverity.WARNING),
    FilterDataEntity(label: 'Indeterminate', data: AlarmSeverity.INDETERMINATE),
  ];

  final alarmStatusSelected = <FilterDataEntity>[];
  final alarmSeveritySelected = <FilterDataEntity>[];

  /// This flag indicates that the user has made changes to the filters.
  /// For example, selecting a status, assignee, or any other filter option.
  bool filtersChanged = false;

  /// This flag is used to indicate that the user has changed and applied filters by clicking the Update button.
  /// It helps determine whether to reset filter changes when the user clicks the back or cancel button.
  /// Logic:
  /// -- If the filters were changed but not applied, clicking the back or cancel button will discard the changes.
  /// -- If the filters were changed and applied, the filters will be preserved as they are.
  bool filtersChangesApplied = false;

  late final StreamSubscription listenNavigationChanges;

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
          leading: BackButton(
            onPressed: () {
              _onBackButtonClick();
            },
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getIt<AlarmTypesBloc>().add(const AlarmTypesRefreshEvent());
            getIt<AssigneeBloc>().add(const AssigneeRefreshEvent());
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FilterToggleBlockWidget<FilterDataEntity>(
                          key: ValueKey(alarmStatusSelected.length),
                          label: 'Alarm status list',
                          items: alarmStatus,
                          selected: alarmStatusSelected.toSet(),
                          onSelectedChanged: (values) {
                            alarmStatusSelected
                              ..clear()
                              ..addAll(values.cast<FilterDataEntity>());

                            setState(() {
                              filtersChanged = true;
                            });
                          },
                          labelAtIndex: (index) => alarmStatus[index].label,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: FilterToggleBlockWidget<FilterDataEntity>(
                            key: ValueKey(alarmSeveritySelected.length),
                            label: 'Alarm severity list',
                            items: alarmSeverity,
                            selected: alarmSeveritySelected.toSet(),
                            onSelectedChanged: (values) {
                              alarmSeveritySelected
                                ..clear()
                                ..addAll(values.cast<FilterDataEntity>());

                              setState(() {
                                filtersChanged = true;
                              });
                            },
                            labelAtIndex: (index) => alarmSeverity[index].label,
                          ),
                        ),
                        AlarmTypesWidget(
                          tbContext: tbContext,
                          onChanged: () {
                            setState(() {
                              filtersChanged = true;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: AlarmAssigneeFilter(
                            tbContext: tbContext,
                            onChanged: () {
                              setState(() {
                                filtersChanged = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    AlarmControlFiltersButton(
                      onResetTap: filtersChanged ? _resetFilters : null,
                      onCancelTap: () {
                        _onBackButtonClick();
                      },
                      onUpdateTap: filtersChanged
                          ? () {
                              final filters = AlarmFiltersEntity.fromUiFilters(
                                typeList: getIt<AlarmTypesBloc>()
                                    .selectedTypes
                                    .toList(),
                                status: alarmStatusSelected
                                    .map((e) => e.data)
                                    .toList()
                                    .cast<AlarmSearchStatus>(),
                                severity: alarmSeveritySelected
                                    .map((e) => e.data)
                                    .toList()
                                    .cast<AlarmSeverity>(),
                                userId: getIt<AssigneeBloc>().selectedUserId,
                              );

                              getIt<AlarmBloc>().add(
                                AlarmFiltersUpdateEvent(
                                  filtersEntity: filters,
                                ),
                              );

                              widget.pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );

                              setState(() {
                                filtersChangesApplied = true;
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    alarmStatusSelected.add(alarmStatus.first);
    listenNavigationChanges = widget
        .tbContext.bottomNavigationTabChangedStream.stream
        .listen((tabIndex) {
      _onBackButtonClick();
    });

    super.initState();
  }

  @override
  void dispose() {
    listenNavigationChanges.cancel();

    super.dispose();
  }

  void _resetFilters() {
    setState(() {
      alarmStatusSelected
        ..clear()
        ..add(alarmStatus.first);
      alarmSeveritySelected.clear();
      filtersChanged = false;
      filtersChangesApplied = false;
    });

    getIt<AlarmTypesBloc>().add(
      const AlarmTypesResetEvent(),
    );
    getIt<AssigneeBloc>().add(
      const AssigneeResetEvent(),
    );
    getIt<AlarmBloc>().add(
      const AlarmFiltersResetEvent(),
    );
  }

  void _onBackButtonClick() {
    widget.pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    if (filtersChanged && !filtersChangesApplied) {
      _resetFilters();
    }
  }
}
