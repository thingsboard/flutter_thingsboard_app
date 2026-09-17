import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class IAssigneeDatasource {
  Future<PageData<UserEmailInfo>> fetchAssignee(PageLink pageKey);
}
