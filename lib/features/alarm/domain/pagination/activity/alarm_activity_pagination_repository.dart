import 'package:thingsboard_app/features/alarm/domain/pagination/activity/alarm_activity_query_ctrl.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

final class AlarmActivityPaginationRepository
    extends PaginationRepository<AlarmCommentsQuery, AlarmCommentInfo> {
  AlarmActivityPaginationRepository({
    required AlarmActivityQueryCtrl queryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: queryCtrl);

  final Future<PageData<AlarmCommentInfo>> Function(AlarmCommentsQuery)
      onFetchPageData;

  @override
  Future<PageData<AlarmCommentInfo>> fetchPageData(AlarmCommentsQuery pageKey) {
    return onFetchPageData(pageKey);
  }
}
