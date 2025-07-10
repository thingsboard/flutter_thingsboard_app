import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/launch_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class UrlAction extends MobileAction {
  Future<String> getUrl(List args);
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller,) async {
    final urlToLaunch = await getUrl(args);
    
    return WidgetMobileActionResult.successResult(await tryLaunch(urlToLaunch));
  }

 static Future<LaunchResult> tryLaunch(
    String url,
  ) async {

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
      return LaunchResult(true);
    } 
      return LaunchResult(false);
  }
}
