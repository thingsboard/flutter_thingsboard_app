import 'dart:async';

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show User, AuthUser, UserId, Authority;
import 'package:thingsboard_app/utils/services/communication/events.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/user/i_user_service.dart';

class UserService implements IUserService {
  UserService({required this.communicationService, required this.logger}) {
    subscription =
        communicationService.on<UserInfoChangedEvent>().listen((event) {
      logger.info('UserService::UserLoggedInEvent received $event');

      user = event.user;
      authUser = event.authUser;
    });
  }

  User? user;
  late AuthUser? authUser;
  late final StreamSubscription subscription;
  final ICommunicationService communicationService;
  final TbLogger logger;

  @override
  bool fullScreenDefaultDashboard() {
    return authUser?.isPublic == true ||
        user?.additionalInfo?['defaultDashboardFullscreen'] == true;
  }

  @override
  String? getDefaultDashboardId() {
    return user?.additionalInfo?['defaultDashboardId'];
  }

  @override
  Future<void> dispose() async {
    return subscription.cancel();
  }

  @override
  ({String? firstName, String? lastName, String? email}) getUserDetails() {
    return (
      firstName: user?.firstName,
      lastName: user?.lastName,
      email: user?.email
    );
  }

  @override
  UserId? getUserId() {
    return user?.id;
  }

  @override
  Authority? getAuthority() {
    return user?.authority;
  }
}
