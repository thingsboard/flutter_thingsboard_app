import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DashboardsBase on EntitiesBaseWithPageLink<DashboardInfo> {

  @override
  String get title => 'Dashboards';

  @override
  String get noItemsFoundText => 'No dashboards found';

  @override
  Future<PageData<DashboardInfo>> fetchEntities(PageLink pageLink) {
    if (tbClient.isTenantAdmin()) {
      return tbClient.getDashboardService().getTenantDashboards(pageLink);
    } else {
      return tbClient.getDashboardService().getCustomerDashboards(tbClient.getAuthUser()!.customerId, pageLink);
    }
  }

  @override
  void onEntityTap(DashboardInfo dashboard) {
    navigateTo('/dashboard/${dashboard.id!.id}?title=${dashboard.title}');
  }

  @override
  Widget buildEntityListCard(BuildContext context, DashboardInfo dashboard) {
    return _buildEntityListCard(context, dashboard, false);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, DashboardInfo dashboard) {
    return _buildEntityListCard(context, dashboard, true);
  }

  @override
  EntityCardSettings entityGridCardSettings(DashboardInfo dashboard) => EntityCardSettings(dropShadow: true); //dashboard.image != null);

  @override
  Widget buildEntityGridCard(BuildContext context, DashboardInfo entity) {
    var hasImage = entity.image != null;
    Widget image;
    if (hasImage) {
      var uriData = UriData.parse(entity.image!);
      image = Image.memory(uriData.contentAsBytes());
    } else {
      image = Image.asset(ThingsboardImage.dashboardPlaceholder);
    }
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          children: [
            Positioned.fill(
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: image,
                  )
            ),
            hasImage ? Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00000000),
                          Color(0xb7000000)
                        ],
                        stops: [0.4219, 1]
                      )
                  )
              ),
            ) : Container(),
            Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: AutoSizeText(entity.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: hasImage ? Colors.white : Color(0xFF282828),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14
                      ),
                    )
            )
          ],
        )
      );
  }

  Widget _buildEntityListCard(BuildContext context, DashboardInfo dashboard, bool listWidgetCard) {
    return Row(
        mainAxisSize: listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Flexible(
              fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: listWidgetCard ? 9 : 10, horizontal: 16),
                child: Row(
                  mainAxisSize: listWidgetCard ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: listWidgetCard ? FlexFit.loose : FlexFit.tight,
                        child:
                        Column(
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
                                        height: 1.7
                                    ))
                            ),
                            Text('${_dashboardDetailsText(dashboard)}',
                                style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    height: 1.33
                                ))
                          ],
                        )
                    ),
                    (!listWidgetCard ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(dashboard.createdTime!)),
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33
                            ))
                      ],
                    ) : Container())
                  ],
                ),
              )
          )
        ]
    );
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
