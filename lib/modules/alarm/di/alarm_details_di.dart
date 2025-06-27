import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/details/alarm_details_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/details/i_alarm_details_datasource.dart';
import 'package:thingsboard_app/modules/alarm/data/repository/details/alarm_details_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/activity/alarm_activity_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/activity/alarm_activity_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/alarm_assignee_pagiation_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/alarm_assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/assign_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/fetch_alarm_assignee_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/unassign_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/acknowledge_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/clear_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/delete_alarm_comment_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/fetch_alarm_comments_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/post_alarm_comments_usecase.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract final class AlarmDetailsDi {

  AlarmDetailsDi._();
  static const _scopeName = 'AlarmDetailsDi';

  static void init(
    ThingsboardClient thingsboardClient, {
    required AlarmId id,
  }) {
    getIt.pushNewScope(
      scopeName: _scopeName,
      init: (locator) {
        locator.registerFactory<IAlarmDetailsDatasource>(
          () => AlarmDetailsDatasource(thingsboardClient),
        );

        locator.registerFactory<IAlarmDetailsRepository>(
          () => AlarmDetailsRepository(locator()),
        );

        locator.registerFactory(
          () => AlarmActivityQueryCtrl(id: id),
        );

        locator.registerFactory(
          () => FetchAlarmUseCase(repository: locator()),
        );

        locator.registerFactory(
          () => FetchAlarmCommentsUseCase(locator()),
        );

        locator.registerFactory(
          () => AcknowledgeAlarmUseCase(locator()),
        );

        locator.registerFactory(
          () => ClearAlarmUseCase(locator()),
        );

        locator.registerFactory(
          () => PostAlarmCommentsUseCase(locator()),
        );

        locator.registerFactory(
          () => DeleteAlarmCommentUseCase(locator()),
        );

        locator.registerFactory(
          () => FetchAlarmAssigneeUseCase(locator()),
        );

        locator.registerLazySingleton(
          () => AlarmActivityPaginationRepository(
            queryCtrl: locator(),
            onFetchPageData: locator<FetchAlarmCommentsUseCase>(),
          ),
        );

        locator.registerLazySingleton(
          () => AlarmAssigneeQueryCtrl(id: id),
        );

        locator.registerFactory(
          () => AssignAlarmUseCase(locator()),
        );

        locator.registerFactory(
          () => UnassignAlarmUseCase(locator()),
        );

        locator.registerLazySingleton(
          () => AlarmAssigneePaginationRepository(
            assigneeQueryCtrl: locator(),
            onFetchPageData: locator<FetchAlarmAssigneeUseCase>(),
          ),
        );
      },
      dispose: () {
        getIt<AlarmActivityPaginationRepository>().dispose();
        getIt<AlarmAssigneePaginationRepository>().dispose();
      },
    );
  }

  static void dispose() {
    getIt.dropScope(_scopeName);
  }
}
