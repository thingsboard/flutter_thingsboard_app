import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

final class AssigneePaginationRepository
    extends PaginationRepository<PageLink, UserInfo> {
  AssigneePaginationRepository({
    required AssigneeQueryCtrl assigneeQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: assigneeQueryCtrl);

  final Future<PageData<UserInfo>> Function(PageLink) onFetchPageData;

  @override
  Future<PageData<UserInfo>> fetchPageData(PageLink pageKey) async {
    return onFetchPageData(pageKey);
  }
}
