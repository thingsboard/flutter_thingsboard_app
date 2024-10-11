import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/di/alarm_details_di.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_assignee/alarm_assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_details/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/activity/alarm_activity_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_assignee/alarm_assignee_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_cotroll_buttons.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_details_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/tb_error_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class AlarmDetailsPage extends TbContextWidget {
  AlarmDetailsPage(
    super.tbContext, {
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<StatefulWidget> createState() => _AlarmDetailsPageState();
}

class _AlarmDetailsPageState extends TbContextState<AlarmDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlarmDetailsBloc>(
          create: (_) => AlarmDetailsBloc.create()
            ..add(AlarmDetailsFetchEvent(id: widget.id)),
        ),
        BlocProvider<AlarmAssigneeBloc>(
          create: (_) => AlarmAssigneeBloc.create(id: widget.id)
            ..add(
              const AlarmFetchAssigneeEvent(),
            ),
        ),
      ],
      child: BlocBuilder<AlarmDetailsBloc, AlarmDetailsState>(
        builder: (context, state) {
          switch (state) {
            case AlarmDetailsLoadingState():
              return Scaffold(
                body: SizedBox.expand(
                  child: Container(
                    color: const Color(0x99FFFFFF),
                    child: const Center(
                      child: TbProgressIndicator(size: 50.0),
                    ),
                  ),
                ),
              );

            case AlarmDetailsLoadedState():
              return Scaffold(
                appBar: TbAppBar(
                  tbContext,
                  title: Text(
                    state.alarmInfo.type,
                    style: TbTextStyles.titleXs.copyWith(
                      color: Colors.black.withOpacity(.87),
                    ),
                  ),
                ),
                body: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: Column(
                              children: [
                                AlarmDetailsWidget(
                                  alarmInfo: state.alarmInfo,
                                  alamDashboardId:
                                      state.alarmInfo.details?['dashboardId'],
                                  tbContext: tbContext,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: AlarmAssigneeWidget(
                                    tbContext: tbContext,
                                  ),
                                ),
                                AlarmActivityWidget(
                                  state.alarmInfo.id!,
                                  tbContext: tbContext,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const AlarmControlButtons(),
                    ],
                  ),
                ),
              );

            case AlarmDetailsErrorState():
              return Scaffold(
                appBar: TbAppBar(
                  tbContext,
                  title: Text(
                    S.of(context).failedToLoadAlarmDetails,
                    style: TbTextStyles.titleXs.copyWith(
                      color: Colors.black.withOpacity(.87),
                    ),
                  ),
                ),
                body: Center(
                  child: TbErrorWidget(
                    title: S.of(context).somethingWentWrong,
                    message: '',
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    AlarmDetailsDi.init(
      widget.tbClient,
      id: AlarmId(widget.id),
    );
    super.initState();
  }

  @override
  void dispose() {
    AlarmDetailsDi.dispose();
    super.dispose();
  }
}
