import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_widget.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetsWidget extends EntitiesWidget<AssetInfo> with AssetsBase {

  AssetsWidget(TbContext tbContext, {EntitiesWidgetController? controller}): super(tbContext, controller: controller);

  @override
  void onViewAll() {
    navigateTo('/assets');
  }

}
