import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

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
