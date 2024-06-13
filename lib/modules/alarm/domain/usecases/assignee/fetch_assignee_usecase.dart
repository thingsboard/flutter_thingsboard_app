import 'package:thingsboard_app/modules/alarm/domain/repository/assignee/i_assigne_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class FetchAssigneeUseCase
    extends UseCase<Future<PageData<UserInfo>>, PageLink> {
  const FetchAssigneeUseCase({required this.repository});

  final IAssigneeRepository repository;

  @override
  Future<PageData<UserInfo>> call(PageLink params) async {
    return repository.fetchAssignee(params);
  }
}
