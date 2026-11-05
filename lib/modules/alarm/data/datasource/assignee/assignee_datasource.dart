import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
// The app barrel re-exports the handwritten `Authority` enum; the generated
// built_value `UserInfo.authority` needs the generated one, so import it prefixed.
import 'package:thingsboard_client/thingsboard_client.dart' as tb_model;
import 'package:thingsboard_client/thingsboard_client.dart';

class AssigneeDatasource implements IAssigneeDatasource {
  const AssigneeDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey) async {
    // Pre-migration this hit GET /api/users/info (findUsersByQuery), which
    // returns users scoped to the current user's tenant/customer hierarchy.
    // getAllUserInfos hits /api/userInfos/all and is restricted for non-sysadmin
    // roles, so it returned only the current user.
    final response = await tbClient.getUserControllerApi().findUsersByQuery(
      pageSize: pageKey.pageSize,
      page: pageKey.page,
      textSearch: pageKey.textSearch,
    );
    final page = response.data!;
    final users =
        page.data?.map(_userEmailInfoToUserInfo).toList() ?? <UserInfo>[];
    return toPageData(users, page.totalPages, page.totalElements, page.hasNext);
  }
}

/// Maps the /api/users/info [UserEmailInfo] onto the app's [UserInfo] carrier.
/// [UserInfo] requires a non-nullable `authority`/`email` that [UserEmailInfo]
/// doesn't provide; neither is used for assignee display, so we fill a neutral
/// [Authority.CUSTOMER_USER] and an empty-string email fallback to satisfy the
/// built_value `.build()` null checks.
UserInfo _userEmailInfoToUserInfo(UserEmailInfo e) => UserInfo(
  (b) =>
      b
        ..id = e.id?.toBuilder()
        ..authority = tb_model.Authority.CUSTOMER_USER
        ..email = e.email ?? ''
        ..firstName = e.firstName
        ..lastName = e.lastName,
);
