import 'package:thingsboard_app/features/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

final class AssigneePaginationRepository
    extends PaginationRepository<PageLink, AssigneeEntity> {
  AssigneePaginationRepository({
    required AssigneeQueryCtrl assigneeQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: assigneeQueryCtrl);

  final Future<PageData<AssigneeEntity>> Function(PageLink) onFetchPageData;

  @override
  Future<PageData<AssigneeEntity>> fetchPageData(PageLink pageKey) async {
    return onFetchPageData(pageKey);
  }
}
