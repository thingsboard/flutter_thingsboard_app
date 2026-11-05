import 'package:thingsboard_app/utils/services/communication/communication_event.dart';
import 'package:thingsboard_client/thingsboard_client.dart' show User;

final class UserLoggedInEvent extends CommunicationEvent {
  const UserLoggedInEvent(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}
