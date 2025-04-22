import 'package:thingsboard_app/services/i_service_has_resource.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show
        AuthUser,
        Authority,
        PageData,
        PageLink,
        User,
        UserId,
        UserInfo,
        UsersAssignQuery;

abstract interface class IUserService implements IServiceHasResource {
  String? getDefaultDashboardId();

  bool fullScreenDefaultDashboard();

  void setUser(User user, {required AuthUser authUser});

  ({String? firstName, String? lastName, String? email}) getUserDetails();

  UserId? getUserId();

  Authority? getAuthority();

  Future<PageData<UserInfo>> getUsersAssign(UsersAssignQuery query);

  Future<PageData<UserInfo>> getUsersInfo(PageLink pageKey);
}
