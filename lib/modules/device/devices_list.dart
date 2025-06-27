import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class DevicesList extends BaseEntitiesWidget<EntityData, EntityDataQuery>
    with DevicesBase, EntitiesListStateBase {

  DevicesList(
    super.tbContext,
    super.pageKeyController, {
    super.key,
    super.searchMode,
    this.displayDeviceImage = false,
  });
  final bool displayDeviceImage;

  @override
  bool displayCardImage(bool listWidgetCard) => displayDeviceImage;
}
