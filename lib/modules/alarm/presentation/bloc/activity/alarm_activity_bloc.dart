import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/activity/alarm_activity_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/delete_alarm_comment_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/fetch_alarm_comments_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/post_alarm_comments_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/activity/bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';

class AlarmActivityBloc extends Bloc<AlarmActivityEvent, AlarmActivityState> {
  AlarmActivityBloc({
    required this.userDetailsUseCase,
    required this.tbContext,
    required this.paginationRepository,
    required this.postAlarmCommentsUseCase,
    required this.deleteAlarmCommentUseCase,
    required this.fetchAlarmCommentsUseCase,
    required this.id,
  }) : super(const AlarmActivityLoadingState()) {
    on(_onEvent);
    subscription = getIt<ICommunicationService>()
        .on<AlarmAssigneeUpdatedEvent>()
        .listen((_) {
      add(const AlarmActivityRefreshEvent());
    });
  }

  factory AlarmActivityBloc.create(
    TbContext tbContext, {
    required AlarmId id,
  }) {
    return AlarmActivityBloc(
      userDetailsUseCase: getIt(),
      tbContext: tbContext,
      paginationRepository: getIt<AlarmActivityPaginationRepository>(),
      postAlarmCommentsUseCase: getIt(),
      deleteAlarmCommentUseCase: getIt(),
      fetchAlarmCommentsUseCase: getIt(),
      id: id,
    );
  }

  final UserDetailsUseCase userDetailsUseCase;
  final TbContext tbContext;
  final AlarmActivityPaginationRepository paginationRepository;
  final PostAlarmCommentsUseCase postAlarmCommentsUseCase;
  final DeleteAlarmCommentUseCase deleteAlarmCommentUseCase;
  final FetchAlarmCommentsUseCase fetchAlarmCommentsUseCase;
  final AlarmId id;
  late final StreamSubscription subscription;

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

        final details = userDetailsUseCase(
          UserDetailsParams(
            firstName: tbContext.userDetails?.firstName,
            lastName: tbContext.userDetails?.lastName,
            email: tbContext.userDetails?.email ?? '',
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

        break;

      case UpdateAlarmCommentEvent():
        add(const AlarmActivityFetchEvent());
        await postAlarmCommentsUseCase(
          PostAlarmCommentParams(
            alarmId: event.alarmId,
            comment: event.comment,
            id: event.id,
          ),
        );
        paginationRepository.pagingController.refresh();

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
