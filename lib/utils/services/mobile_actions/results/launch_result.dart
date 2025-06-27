import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LaunchResult extends MobileActionResult {

  LaunchResult(this.launched);
  bool launched;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['launched'] = launched;
    return json;
  }
}
