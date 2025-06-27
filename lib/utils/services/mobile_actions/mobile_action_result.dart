import 'package:thingsboard_app/utils/services/mobile_actions/results/device_provisioning_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/image_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/launch_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/location_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/qr_code_result.dart';
abstract  class MobileActionResult {
  MobileActionResult();

  factory MobileActionResult.launched(bool launched) {
    return LaunchResult(launched);
  }

  factory MobileActionResult.image(String imageUrl) {
    return ImageResult(imageUrl);
  }

  factory MobileActionResult.qrCode(String code, String format) {
    return QrCodeResult(code, format);
  }

  factory MobileActionResult.location(num latitude, num longitude) {
    return LocationResult(latitude, longitude);
  }

  factory MobileActionResult.provisioning(String deviceName) {
    return DeviceProvisioningResult(deviceName);
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    return json;
  }
}
