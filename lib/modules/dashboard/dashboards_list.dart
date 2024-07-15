import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

import 'dashboards_base.dart';

class DashboardsList extends BaseEntitiesWidget<DashboardInfo, PageLink>
    with DashboardsBase, EntitiesListStateBase {
  DashboardsList(
    TbContext tbContext,
    PageKeyController<PageLink> pageKeyController, {
    super.key,
  }) : super(tbContext, pageKeyController);
}
