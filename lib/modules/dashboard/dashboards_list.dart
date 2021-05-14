import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'dashboards_base.dart';

class DashboardsList extends BaseEntitiesPageLinkWidget<DashboardInfo> with DashboardsBase, EntitiesListStateBase {

  DashboardsList(TbContext tbContext) : super(tbContext);

}

