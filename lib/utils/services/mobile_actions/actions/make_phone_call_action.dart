import 'package:thingsboard_app/utils/services/mobile_actions/actions/url_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class MakePhoneCallAction extends UrlAction {

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.makePhoneCall;
  String _makePhoneCall(List<dynamic> args) {
    try {
      dynamic phoneNumber;
      if (args.length > 1 && args[1] != null) {
        phoneNumber = args[1];
      } else {
        return '';
      }
      return 'tel://$phoneNumber';
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> getUrl(List args) async => _makePhoneCall(args);
}
