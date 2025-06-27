
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/device_provisioning_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/get_location_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/make_phone_call_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/scan_qr_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/show_map_location_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/show_map_with_directions_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/take_photo_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/take_picture_from_gallery_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/take_screenshot_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/unknown_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';
class WidgetActionHandler {
  static final  actions = [
    DeviceProvisioningAction(),
    UnknownAction(),
    ShowMapLocationAction(),
    ShowMapWithDirectionsAction(),
    TakePhotoAction(),
    TakePictureFromGalleryAction(),
    ScanQrAction(),
    MakePhoneCallAction(),
    GetLocationAction(),
    TakeScreenshotAction(),
  ];
  Future<Map<String, dynamic>> handleWidgetMobileAction(
    List<dynamic> args,
    InAppWebViewController controller,
  ) async {
    final result = await _handleWidgetMobileAction(args, controller);
    return result.toJson();
  }

  Future<WidgetMobileActionResult> _handleWidgetMobileAction(
    List<dynamic> args,
    InAppWebViewController controller,
  ) async {
    if (args.isNotEmpty && args[0] is String) {
      final actionType = WidgetMobileActionType.fromString(args[0].toString());
      final actionToCall = actions.firstWhere(
        (action) => action.type == actionType,
        orElse: () => UnknownAction(),
      );
      return await actionToCall.execute(
        args,
        controller,
      );
    } else {
      return WidgetMobileActionResult.errorResult(
        'actionType is not provided.',
      );
    }
  }




 
}
