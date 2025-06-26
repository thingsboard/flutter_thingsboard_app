import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

final class AlarmAssigneeUpdatedEvent extends CommunicationEvent {
  const AlarmAssigneeUpdatedEvent(this.id);

  final String? id;

  @override
  List<Object?> get props => [id];
}
