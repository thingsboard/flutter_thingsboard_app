import 'package:thingsboard_app/utils/services/mobile_actions/actions/url_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class ShowMapLocationAction extends UrlAction {
  @override
  WidgetMobileActionType get type => WidgetMobileActionType.mapLocation;
  @override
  Future<String>  getUrl(args) => getMapUrl(args, false);
 Future<String> getMapUrl(
    List<dynamic> args,
    bool directionElseLocation,
  ) async {
    try {
      num? lat;
      num? lon;
      if (args.length > 2 && args[1] is num && args[2] is num) {
        lat = args[1];
        lon = args[2];
      } else {
        return '';
      }
      var url = 'https://www.google.com/maps/';
      url += directionElseLocation
          ? 'dir/?api=1&destination=$lat,$lon'
          : 'search/?api=1&query=$lat,$lon';
      return url;
    } catch (e) {
      return '';
    }
  }
}
