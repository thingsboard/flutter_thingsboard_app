import 'package:thingsboard_app/config/themes/wl_theme_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class WlService {
  final TbContext _tbContext;

  WhiteLabelingParams? wlParams;

  factory WlService(TbContext tbContext) {
    return WlService._internal(tbContext);
  }

  WlService._internal(this._tbContext);

  Future<void> updateWhiteLabeling() async {
    if (_tbContext.tbClient.isAuthenticated()) {
      wlParams = await _tbContext.tbClient.getWhiteLabelingService().getWhiteLabelParams();
    } else {
      wlParams = await _tbContext.tbClient.getWhiteLabelingService().getLoginWhiteLabelParams();
    }
    WlThemeWidget.of(_tbContext.currentState!.context)!.setWlParams(wlParams!);
  }

}
