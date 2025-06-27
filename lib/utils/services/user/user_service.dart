import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_logged_in_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/user/i_user_service.dart';

class UserService implements IUserService {
  UserService() {
    getIt<ICommunicationService>().on<UserLoggedInEvent>().listen((user) {});
  }
}
