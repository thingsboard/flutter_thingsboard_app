import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DashboardsBase on EntitiesBase<DashboardInfo, PageLink> {
  @override
  String get title => 'Dashboards';

  @override
  String get noItemsFoundText => 'No dashboards found';

  @override
  Future<PageData<DashboardInfo>> fetchEntities(PageLink pageLink) {
    if (tbClient.isTenantAdmin()) {
      return tbClient
          .getDashboardService()
          .getTenantDashboards(pageLink, mobile: true);
    } else {
      return tbClient.getDashboardService().getCustomerDashboards(
          tbClient.getAuthUser()!.customerId!, pageLink,
          mobile: true);
    }
  }

  @override
  void onEntityTap(DashboardInfo dashboard) {
    navigateToDashboard(dashboard.id!.id!, dashboardTitle: dashboard.title);
    // navigateTo('/fullscreenDashboard/${dashboard.id!.id}?title=${dashboard.title}');
    // navigateTo('/dashboard/${dashboard.id!.id}?title=${dashboard.title}');
  }

  @override
  Widget buildEntityListCard(BuildContext context, DashboardInfo dashboard) {
    return _buildEntityListCard(context, dashboard, false);
  }

  @override
  Widget buildEntityListWidgetCard(
      BuildContext context, DashboardInfo dashboard) {
    return _buildEntityListCard(context, dashboard, true);
  }

  @override
  EntityCardSettings entityGridCardSettings(DashboardInfo dashboard) =>
      EntityCardSettings(dropShadow: true); //dashboard.image != null);

  @override
  Widget buildEntityGridCard(BuildContext context, DashboardInfo dashboard) {
    return DashboardGridCard(tbContext, dashboard: dashboard);
  }

  Widget _buildEntityListCard(
      BuildContext context, DashboardInfo dashboard, bool listWidgetCard) {
    return Row(
        mainAxisSize: listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Flexible(
              fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: listWidgetCard ? 9 : 10, horizontal: 16),
                child: Row(
                  mainAxisSize:
                      listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                child: Text('${dashboard.title}',
                                    style: TextStyle(
                                        color: Color(0xFF282828),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.7))),
                            Text('${_dashboardDetailsText(dashboard)}',
                                style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    height: 1.33))
                          ],
                        )),
                    (!listWidgetCard
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  entityDateFormat.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          dashboard.createdTime!)),
                                  style: TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      height: 1.33))
                            ],
                          )
                        : Container())
                  ],
                ),
              ))
        ]);
  }

  String _dashboardDetailsText(DashboardInfo dashboard) {
    if (tbClient.isTenantAdmin()) {
      if (_isPublicDashboard(dashboard)) {
        return 'Public';
      } else {
        return dashboard.assignedCustomers.map((e) => e.title).join(', ');
      }
    }
    return '';
  }

  bool _isPublicDashboard(DashboardInfo dashboard) {
    return dashboard.assignedCustomers.any((element) => element.isPublic);
  }
}

class DashboardGridCard extends TbContextWidget {
  final DashboardInfo dashboard;

  DashboardGridCard(TbContext tbContext, {required this.dashboard})
      : super(tbContext);

  @override
  _DashboardGridCardState createState() => _DashboardGridCardState();
}

class _DashboardGridCardState extends TbContextState<DashboardGridCard> {
  _DashboardGridCardState() : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(DashboardGridCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var hasImage = widget.dashboard.image != null;
    Widget image;
    if (hasImage) {
      image = Utils.imageFromBase64(widget.dashboard.image!);
    } else {
      image = SvgPicture.asset(ThingsboardImage.dashboardPlaceholder,
          color: Theme.of(context).primaryColor,
          colorBlendMode: BlendMode.overlay,
          semanticsLabel: 'Dashboard');
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Column(
          children: [
            Expanded(
                child: Stack(children: [
              SizedBox.expand(
                  child: FittedBox(
                      clipBehavior: Clip.hardEdge,
                      fit: BoxFit.cover,
                      child: image))
            ])),
            Divider(height: 1),
            Container(
              height: 44,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Center(
                      child: AutoSizeText(
                    widget.dashboard.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14),
                  ))),
            )
          ],
        ));
  }
}
