import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';

class AssigneeDatasource implements IAssigneeDatasource {
  const AssigneeDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<UserEmailInfo>> fetchAssignee(PageLink pageKey) async {
    // Pre-migration this hit GET /api/users/info (findUsersByQuery), which
    // returns users scoped to the current user's tenant/customer hierarchy.
    final response = await tbClient.getUserControllerApi().findUsersByQuery(
      pageSize: pageKey.pageSize,
      page: pageKey.page,
      textSearch: pageKey.textSearch,
    );
    final page = response.data!;
    return toPageData(
      page.data,
      page.totalPages,
      page.totalElements,
      page.hasNext,
    );
  }
}
