import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class QrCodeResult extends MobileActionResult {
  String code;
  String format;

  QrCodeResult(this.code, this.format);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['code'] = code;
    json['format'] = format;
    return json;
  }
}
