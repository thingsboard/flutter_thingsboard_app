import 'dart:async';

import 'package:thingsboard_app/services/communication/i_communication_service.dart'
    show GlobalLogoutEvent, ICommunicationService;
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show
        AuthUser,
        Authority,
        PageData,
        PageLink,
        ThingsboardClient,
        User,
        UserId,
        UserInfo,
        UsersAssignQuery;

class UserService implements IUserService {
  UserService({
    required this.communicationService,
    required this.logger,
    required this.tbClient,
  }) {
    subscription = communicationService.on<GlobalLogoutEvent>().listen((event) {
      _user = null;
      _authUser = null;
    });
  }

  User? _user;
  AuthUser? _authUser;

  late final StreamSubscription subscription;
  final ICommunicationService communicationService;
  final ILoggerService logger;
  final ThingsboardClient tbClient;

  @override
  bool fullScreenDefaultDashboard() {
    return _authUser?.isPublic == true ||
        _user?.additionalInfo?['defaultDashboardFullscreen'] == true;
  }

  @override
  String? getDefaultDashboardId() {
    return _user?.additionalInfo?['defaultDashboardId'];
  }

  @override
  ({String? firstName, String? lastName, String? email}) getUserDetails() {
    return (
      firstName: _user?.firstName,
      lastName: _user?.lastName,
      email: _user?.email
    );
  }

  @override
  UserId? getUserId() {
    return _user?.id;
  }

  @override
  Authority? getAuthority() {
    return _user?.authority;
  }

  @override
  void setUser(User user, {required AuthUser authUser}) {
    _user = user;
    _authUser = authUser;
  }

  @override
  Future<PageData<UserInfo>> getUsersAssign(UsersAssignQuery query) {
    return tbClient.getUserService().getUsersAssign(query);
  }

  @override
  Future<PageData<UserInfo>> getUsersInfo(PageLink pageKey) {
    return tbClient.getUserService().getUsersInfo(pageKey);
  }

  @override
  Future<void> dispose() async {
    return subscription.cancel();
  }
}
