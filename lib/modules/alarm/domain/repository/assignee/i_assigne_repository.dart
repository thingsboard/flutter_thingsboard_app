import 'package:thingsboard_pe_client/thingsboard_client.dart';

abstract interface class IAssigneeRepository {
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey);
}
