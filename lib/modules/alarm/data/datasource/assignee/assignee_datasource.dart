import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AssigneeDatasource implements IAssigneeDatasource {
  const AssigneeDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey) async {
    return tbClient.getUserService().getUsersInfo(pageKey);
  }
}
