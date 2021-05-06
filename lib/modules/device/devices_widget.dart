import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_widget.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DevicesWidget extends EntitiesWidget<DeviceInfo> with DevicesBase {

  DevicesWidget(TbContext tbContext, {EntitiesWidgetController? controller}): super(tbContext, controller: controller);

  @override
  void onViewAll() {
    navigateTo('/devices');
  }

}
