import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DashboardsWidget extends EntitiesWidget<DashboardInfo> with DashboardsBase {

  DashboardsWidget(TbContext tbContext, {EntitiesWidgetController? controller}): super(tbContext, controller: controller);

  @override
  void onViewAll() {
    navigateTo('/dashboards');
  }

}
