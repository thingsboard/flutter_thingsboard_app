import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/alarm_types_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_control_filters_button.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_types/alarm_types_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/alarm_assignee_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/filter_toggle_block_widget.dart';
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
  late final IAlarmFiltersService filtersService;

  /// This flag indicates that the user has made changes to the filters.
  /// For example, selecting a status, assignee, or any other filter option.
  bool filtersChanged = false;

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
          title:  Text(S.of(context).filters),
          leading: BackButton(
            onPressed: () {
              _onBackButtonClick();
            },
          ),
          canGoBack: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getIt<AlarmTypesBloc>().add(const AlarmTypesRefreshEvent());
            getIt<AssigneeBloc>().add(const AssigneeRefreshEvent());
          },
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilterToggleBlockWidget<FilterDataEntity>(
                            key: ValueKey(
                              filtersService.getSelectedFilter(Filters.status),
                            ),
                            label: S.of(context).alarmStatusList,
                            items: filtersService.statuses,
                            selected: filtersService
                                .getSelectedFilter(Filters.status),
                            onSelectedChanged: (values) {
                              filtersService.setSelectedFilter(
                                Filters.status,
                                data: values.cast<FilterDataEntity>(),
                              );

                              setState(() {
                                filtersChanged = true;
                              });
                            },
                            labelAtIndex: (index) =>
                                filtersService.statuses[index].getLocalizedLabel(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: FilterToggleBlockWidget<FilterDataEntity>(
                              key: ValueKey(
                                filtersService
                                    .getSelectedFilter(Filters.severity),
                              ),
                              label: S.of(context).alarmSeverityList,
                              items: filtersService.severities,
                              selected: filtersService
                                  .getSelectedFilter(Filters.severity),
                              onSelectedChanged: (values) {
                                filtersService.setSelectedFilter(
                                  Filters.severity,
                                  data: values,
                                );

                                setState(() {
                                  filtersChanged = true;
                                });
                              },
                              labelAtIndex: (index) =>
                                  filtersService.severities[index].getLocalizedLabel(context),
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
                            child: AlarmAssigneeFilterWidget(
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
                    ),
                  ),
                  AlarmControlFiltersButton(
                    onResetTap: filtersChanged ? _resetFilters : null,
                    onCancelTap: () {
                      _onBackButtonClick();
                    },
                    onUpdateTap: filtersChanged
                        ? () {
                            filtersService.commitChanges();

                            getIt<AlarmBloc>().add(
                              AlarmFiltersUpdateEvent(
                                filtersEntity:
                                    filtersService.getCommittedFilters(),
                              ),
                            );

                            widget.pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                  ),
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
    filtersService = getIt<IAlarmFiltersService>();

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
      filtersService.reset();
      filtersChanged = false;
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
    widget.pageController
        .animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    )
        .then((_) {
      if (mounted && filtersChanged) {
        setState(() {
          filtersService.resetUnCommittedChanges();

          getIt<AlarmTypesBloc>()
              .add(const AlarmTypesResetUnCommittedChanges());
          getIt<AssigneeBloc>().add(const AssigneeResetUnCommittedChanges());
        });
      }
    });
  }
}
