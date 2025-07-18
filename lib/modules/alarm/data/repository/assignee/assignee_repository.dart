import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/assignee/i_assigne_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssigneeRepository implements IAssigneeRepository {
  const AssigneeRepository({required this.datasource});

  final IAssigneeDatasource datasource;

  @override
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey)  {
    return datasource.fetchAssignee(pageKey);
  }
}
