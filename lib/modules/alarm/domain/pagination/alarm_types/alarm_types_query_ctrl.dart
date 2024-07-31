import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmTypesQueryCtrl extends PageKeyController<PageLink> {
  AlarmTypesQueryCtrl({
    int pageSize = 20,
    String? searchText,
    SortOrder? sortOrder,
  }) : super(
          PageLink(
            pageSize,
            0,
            searchText,
            sortOrder,
          ),
        );

  @override
  PageLink nextPageKey(PageLink pageKey) {
    return pageKey.nextPageLink();
  }

  void refresh() {
    notifyListeners();
  }
}
