import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmAssigneeQueryCtrl extends PageKeyController<UsersAssignQuery> {
  AlarmAssigneeQueryCtrl({
    required AlarmId id,
    int pageSize = 50,
    String? searchText,
    SortOrder? sortOrder,
  }) : super(
          UsersAssignQuery(
            pageLink: PageLink(
              pageSize,
              0,
              searchText,
              sortOrder ?? SortOrder('email', Direction.ASC),
            ),
            id: id,
          ),
        );

  @override
  UsersAssignQuery nextPageKey(UsersAssignQuery pageKey) {
    return UsersAssignQuery(
      pageLink: pageKey.pageLink.nextPageLink(),
      id: pageKey.id,
    );
  }

  void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;

    notifyListeners();
  }
}
