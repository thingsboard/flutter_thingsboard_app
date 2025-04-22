import 'package:thingsboard_app/features/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssigneeDatasource implements IAssigneeDatasource {
  const AssigneeDatasource({required this.tbClient});

  final ITbClientService tbClient;

  @override
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey) async {
    return tbClient.userService.getUsersInfo(pageKey);
  }
}
