import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_types/alarm_types_query_ctrl.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

final class AlarmTypesPaginationRepository
    extends PaginationRepository<PageLink, EntitySubtype> {
  AlarmTypesPaginationRepository({
    required AlarmTypesQueryCtrl alarmTypesQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: alarmTypesQueryCtrl);

  final Future<PageData<EntitySubtype>> Function(PageLink) onFetchPageData;

  @override
  Future<PageData<EntitySubtype>> fetchPageData(PageLink pageKey) {
    return onFetchPageData(pageKey);
  }
}
