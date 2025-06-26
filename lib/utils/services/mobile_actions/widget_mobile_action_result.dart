import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class WidgetMobileActionResult<T extends MobileActionResult> {
  T? result;
  bool hasResult = false;
  String? error;
  bool hasError = false;

  WidgetMobileActionResult.errorResult(this.error)
      : hasError = true,
        hasResult = false;

  WidgetMobileActionResult.successResult(this.result)
      : hasError = false,
        hasResult = true;

  WidgetMobileActionResult.emptyResult()
      : hasError = false,
        hasResult = false;

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['hasError'] = hasError;
    json['hasResult'] = hasResult;
    json['error'] = error;
    json['result'] = result?.toJson();
    return json;
  }
}
