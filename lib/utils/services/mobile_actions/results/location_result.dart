import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LocationResult extends MobileActionResult {

  LocationResult(this.latitude, this.longitude);
  num latitude;
  num longitude;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    return json;
  }
}
