import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class DeviceProvisioningResult extends MobileActionResult {
  DeviceProvisioningResult(this.deviceName);

  final String deviceName;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['deviceName'] = deviceName;
    return json;
  }
}
