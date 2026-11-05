import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAssigneeRepository {
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey);
}
