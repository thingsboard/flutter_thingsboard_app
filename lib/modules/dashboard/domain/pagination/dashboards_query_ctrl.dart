import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class DashboardsQueryCtrl extends PageKeyController<PageLink> {
  DashboardsQueryCtrl() : super(PageLink(20));

  @override
  PageLink nextPageKey(PageLink pageKey) {
    return pageKey.nextPageLink();
  }
}
