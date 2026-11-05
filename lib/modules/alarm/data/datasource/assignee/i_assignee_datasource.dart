import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAssigneeDatasource {
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey);
}
