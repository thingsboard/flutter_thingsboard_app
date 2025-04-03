import 'package:thingsboard_app/thingsboard_client.dart' show UserId, Authority;

abstract interface class IUserService {
  String? getDefaultDashboardId();

  bool fullScreenDefaultDashboard();

  ({String? firstName, String? lastName, String? email}) getUserDetails();

  UserId? getUserId();

  Authority? getAuthority();

  Future<void> dispose();
}
