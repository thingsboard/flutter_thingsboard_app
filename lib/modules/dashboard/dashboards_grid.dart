import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'dashboards_base.dart';

class DashboardsGrid extends BaseEntitiesPageLinkWidget<DashboardInfo> with DashboardsBase, EntitiesGridStateBase  {

  DashboardsGrid(TbContext tbContext) : super(tbContext);

}

