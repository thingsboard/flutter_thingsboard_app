import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LocationResult extends MobileActionResult {
  num latitude;
  num longitude;

  LocationResult(this.latitude, this.longitude);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    return json;
  }
}
