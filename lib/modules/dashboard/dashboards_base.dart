import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DashboardsBase on EntitiesBase<DashboardInfo> {

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
  Widget buildEntityCard(BuildContext context, DashboardInfo dashboard, bool briefView) {
    return Row(
        mainAxisSize: briefView ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Flexible(
              fit: briefView ? FlexFit.loose : FlexFit.tight,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: briefView ? 9 : 10, horizontal: 16),
                child: Row(
                  mainAxisSize: briefView ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: briefView ? FlexFit.loose : FlexFit.tight,
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
                    (!briefView ? Column(
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

  @override
  void onEntityDetails(DashboardInfo dashboard) {
    navigateTo('/dashboard/${dashboard.id!.id}?title=${dashboard.title}');
  }


}
