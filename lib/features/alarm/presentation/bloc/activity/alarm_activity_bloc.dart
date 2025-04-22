import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/activity/alarm_activity_pagination_repository.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/details/delete_alarm_comment_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/details/fetch_alarm_comments_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/details/post_alarm_comments_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_events.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_states.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

import '../../../../../services/communication/i_communication_service.dart'
    show AlarmAssigneeUpdatedEvent, ICommunicationService;

class AlarmActivityBloc extends Bloc<AlarmActivityEvent, AlarmActivityState> {
  AlarmActivityBloc({
    required this.userDetailsUseCase,
    required this.userService,
    required this.paginationRepository,
    required this.postAlarmCommentsUseCase,
    required this.deleteAlarmCommentUseCase,
    required this.fetchAlarmCommentsUseCase,
    required this.id,
    required this.logger,
  }) : super(const AlarmActivityLoadingState()) {
    on(_onEvent);
    subscription = getIt<ICommunicationService>()
        .on<AlarmAssigneeUpdatedEvent>()
        .listen((_) {
      add(const AlarmActivityRefreshEvent());
    });
  }

  factory AlarmActivityBloc.create({
    required AlarmId id,
  }) {
    return AlarmActivityBloc(
      userDetailsUseCase: getIt(),
      userService: getIt(),
      paginationRepository: getIt<AlarmActivityPaginationRepository>(),
      postAlarmCommentsUseCase: getIt(),
      deleteAlarmCommentUseCase: getIt(),
      fetchAlarmCommentsUseCase: getIt(),
      id: id,
      logger: getIt(),
    );
  }

  final UserDetailsUseCase userDetailsUseCase;
  final IUserService userService;
  final AlarmActivityPaginationRepository paginationRepository;
  final PostAlarmCommentsUseCase postAlarmCommentsUseCase;
  final DeleteAlarmCommentUseCase deleteAlarmCommentUseCase;
  final FetchAlarmCommentsUseCase fetchAlarmCommentsUseCase;
  final AlarmId id;
  late final StreamSubscription subscription;
  final ILoggerService logger;

  List<AlarmCommentInfo>? comments;

  Future<void> _onEvent(
    AlarmActivityEvent event,
    Emitter<AlarmActivityState> emit,
  ) async {
    switch (event) {
      case AlarmActivityFetchEvent():
        comments ??= (await fetchAlarmCommentsUseCase(
          AlarmCommentsQuery(
            pageLink: PageLink(1),
            id: id,
          ),
        ))
            .data;

        final userDetails = userService.getUserDetails();
        final details = userDetailsUseCase(
          UserDetailsParams(
            firstName: userDetails.firstName,
            lastName: userDetails.lastName,
            email: userDetails.email ?? '',
          ),
        );

        emit(
          AlarmActivityLoadedState(
            displayName: details.displayName,
            shortName: details.shortName,
            hasSomeActivity: comments?.isNotEmpty == true,
          ),
        );

        break;
      case PostAlarmCommentEvent():
        try {
          await postAlarmCommentsUseCase(
            PostAlarmCommentParams(
              alarmId: event.alarmId,
              comment: event.comment,
            ),
          );

          if (comments?.isNotEmpty == true) {
            paginationRepository.pagingController.refresh();
          } else {
            add(const AlarmActivityRefreshEvent());
          }
        } catch (e) {
          logger.debug(e);
        }

        break;

      case UpdateAlarmCommentEvent():
        add(const AlarmActivityFetchEvent());
        try {
          await postAlarmCommentsUseCase(
            PostAlarmCommentParams(
              alarmId: event.alarmId,
              comment: event.comment,
              id: event.id,
            ),
          );
          paginationRepository.pagingController.refresh();
        } catch (e) {
          logger.debug(e);
        }

        break;
      case AlarmEditCommentEvent():
        emit(
          AlarmCommentEditState(
            event.commentId,
            alarmId: event.alarmId,
            commentToEdit: event.comment,
          ),
        );

        break;
      case DeleteAlarmCommentEvent():
        await deleteAlarmCommentUseCase(
          DeleteCommentParams(
            alarmId: event.alarmId,
            commentId: event.commentId,
          ),
        );
        paginationRepository.pagingController.refresh();

        break;
      case CancelAlarmCommentEditing():
        add(const AlarmActivityFetchEvent());

        break;
      case AlarmActivityRefreshEvent():
        if (comments?.isEmpty == true) {
          comments = null;
        }

        paginationRepository.pagingController.refresh();
        add(const AlarmActivityFetchEvent());

        break;
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
