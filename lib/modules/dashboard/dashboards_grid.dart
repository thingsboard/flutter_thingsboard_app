import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'dashboards_base.dart';

class DashboardsGridWidget extends TbContextWidget {
  DashboardsGridWidget(TbContext tbContext) : super(tbContext);

  @override
  _DashboardsGridWidgetState createState() => _DashboardsGridWidgetState();
}

class _DashboardsGridWidgetState extends TbContextState<DashboardsGridWidget> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    return DashboardsGrid(tbContext, _pageLinkController);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}

class DashboardsGrid extends BaseEntitiesWidget<DashboardInfo, PageLink>
    with DashboardsBase, EntitiesGridStateBase {
  DashboardsGrid(
      TbContext tbContext, PageKeyController<PageLink> pageKeyController)
      : super(tbContext, pageKeyController);
}
