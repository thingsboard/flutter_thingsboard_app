import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DevicesList extends BaseEntitiesPageLinkWidget<DeviceInfo> with DevicesBase, EntitiesListStateBase {

  DevicesList(TbContext tbContext) : super(tbContext);

}

