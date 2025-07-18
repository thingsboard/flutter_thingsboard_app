import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/alarm_assignee_query_ctrl.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

final class AlarmAssigneePaginationRepository
    extends PaginationRepository<UsersAssignQuery, AssigneeEntity> {
  AlarmAssigneePaginationRepository({
    required AlarmAssigneeQueryCtrl assigneeQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: assigneeQueryCtrl);

  final Future<PageData<AssigneeEntity>> Function(UsersAssignQuery)
      onFetchPageData;

  @override
  Future<PageData<AssigneeEntity>> fetchPageData(
    UsersAssignQuery pageKey,
  )  {
    return onFetchPageData(pageKey);
  }
}
