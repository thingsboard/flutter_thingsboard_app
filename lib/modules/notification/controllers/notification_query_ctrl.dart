import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class NotificationQueryCtrl extends PageKeyController<PushNotificationQuery> {
  NotificationQueryCtrl({int pageSize = 20, String? searchText})
      : super(
          PushNotificationQuery(
            TimePageLink(
              pageSize,
              0,
              searchText,
              SortOrder('createdTime', Direction.DESC),
            ),
            unreadOnly: true,
          ),
        );

  @override
  PushNotificationQuery nextPageKey(PushNotificationQuery pageKey) {
    return PushNotificationQuery(
      pageKey.pageLink.nextPageLink(),
      unreadOnly: value.pageKey.unreadOnly,
    );
  }

  void onSearchText(String searchText) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;

    notifyListeners();
  }

  void filterByReadStatus(bool unreadOnly) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.unreadOnly = unreadOnly;

    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
