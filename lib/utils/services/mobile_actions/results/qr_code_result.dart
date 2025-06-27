import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class QrCodeResult extends MobileActionResult {

  QrCodeResult(this.code, this.format);
  String code;
  String format;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['code'] = code;
    json['format'] = format;
    return json;
  }
}
