import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

base class CommunicationEvent extends Equatable {
  const CommunicationEvent();

  @override
  List<Object?> get props => [];
}

final class UserLoggedInEvent extends CommunicationEvent {
  const UserLoggedInEvent(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}
