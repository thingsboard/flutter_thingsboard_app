import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class WidgetMobileActionResult<T extends MobileActionResult> {

  WidgetMobileActionResult.errorResult(this.error)
      : hasError = true,
        hasResult = false;

  WidgetMobileActionResult.successResult(this.result)
      : hasError = false,
        hasResult = true;

  WidgetMobileActionResult.emptyResult()
      : hasError = false,
        hasResult = false;
  T? result;
  bool hasResult = false;
  String? error;
  bool hasError = false;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['hasError'] = hasError;
    json['hasResult'] = hasResult;
    json['error'] = error;
    json['result'] = result?.toJson();
    return json;
  }
}
