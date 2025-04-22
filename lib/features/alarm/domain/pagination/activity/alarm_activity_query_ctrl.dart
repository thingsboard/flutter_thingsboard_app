import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmActivityQueryCtrl extends PageKeyController<AlarmCommentsQuery> {
  AlarmActivityQueryCtrl({
    required AlarmId id,
    int pageSize = 20,
    SortOrder? sortOrder,
  }) : super(
          AlarmCommentsQuery(
            pageLink: PageLink(
              pageSize,
              0,
              null,
              sortOrder ?? SortOrder('createdTime', Direction.ASC),
            ),
            id: id,
          ),
        );

  @override
  AlarmCommentsQuery nextPageKey(AlarmCommentsQuery pageKey) {
    return AlarmCommentsQuery(
      pageLink: pageKey.pageLink.nextPageLink(),
      id: pageKey.id,
    );
  }
}
