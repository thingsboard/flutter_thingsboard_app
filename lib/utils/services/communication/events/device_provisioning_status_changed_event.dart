import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart' show DeviceProvisioningStatus;
import 'package:thingsboard_app/utils/services/communication/communication_event.dart';

final class DeviceProvisioningStatusChangedEvent extends CommunicationEvent {
  const DeviceProvisioningStatusChangedEvent(this.status);

  final DeviceProvisioningStatus status;

  @override
  List<Object?> get props => [double.nan];
}
