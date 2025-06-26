import 'package:thingsboard_app/thingsboard_client.dart' show User;
import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

final class UserLoggedInEvent extends CommunicationEvent {
  const UserLoggedInEvent(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}
