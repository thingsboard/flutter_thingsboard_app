import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class GetLocationAction extends MobileAction {
  Future<bool> _checkService() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (!await Geolocator.openLocationSettings()) {
        return false;
      }
     return _checkService();
    }
    return true;
  }

  Future<WidgetMobileActionResult> _getLocation() async {
    try {
      final  serviceEnabled = await _checkService();
      if (!serviceEnabled) {
        return WidgetMobileActionResult.errorResult(
          'Location services are disabled.',
        );
      }
      LocationPermission permission;

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return WidgetMobileActionResult.errorResult(
            'Location permissions are denied.',
          );
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return WidgetMobileActionResult.errorResult(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return WidgetMobileActionResult.successResult(
        MobileActionResult.location(position.latitude, position.longitude),
      );
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller,) {
    return _getLocation();
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.getLocation;
}
