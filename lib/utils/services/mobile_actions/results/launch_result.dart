import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LaunchResult extends MobileActionResult {
  bool launched;

  LaunchResult(this.launched);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['launched'] = launched;
    return json;
  }
}
