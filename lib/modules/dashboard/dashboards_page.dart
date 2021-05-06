import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_page.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DashboardsPage extends EntitiesPage<DashboardInfo> with DashboardsBase {

  DashboardsPage(TbContext tbContext) :
        super(tbContext);


  @override
  String get noMoreItemsText => 'No more dashboards';

  @override
  String get searchHint => 'Search dashboards';

}
