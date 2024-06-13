import 'package:thingsboard_pe_client/thingsboard_client.dart';

abstract interface class IAssigneeDatasource {
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey);
}
