import 'package:flutter/src/foundation/key.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DashboardsListWidget extends EntitiesListPageLinkWidget<DashboardInfo>
    with DashboardsBase {
  DashboardsListWidget(TbContext tbContext,
      {Key? key, EntitiesListWidgetController? controller})
      : super(tbContext, key: key, controller: controller);

  @override
  void onViewAll() {
    navigateTo('/dashboards');
  }
}
