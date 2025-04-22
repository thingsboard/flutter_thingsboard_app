import 'package:thingsboard_app/features/alarm/domain/pagination/alarm_types/alarm_types_query_ctrl.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

final class AlarmTypesPaginationRepository
    extends PaginationRepository<PageLink, AlarmType> {
  AlarmTypesPaginationRepository({
    required AlarmTypesQueryCtrl alarmTypesQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: alarmTypesQueryCtrl);

  final Future<PageData<AlarmType>> Function(PageLink) onFetchPageData;

  @override
  Future<PageData<AlarmType>> fetchPageData(PageLink pageKey) async {
    return onFetchPageData(pageKey);
  }
}
