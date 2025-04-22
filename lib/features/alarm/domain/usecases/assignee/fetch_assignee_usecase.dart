import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/features/alarm/domain/repository/assignee/i_assigne_repository.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchAssigneeUseCase
    extends UseCase<Future<PageData<AssigneeEntity>>, PageLink> {
  const FetchAssigneeUseCase({required this.repository});

  final IAssigneeRepository repository;

  @override
  Future<PageData<AssigneeEntity>> call(PageLink params) async {
    final pageData = await repository.fetchAssignee(params);

    return PageData(
      pageData.data
          .map(
            (info) => AssigneeEntity.fromUserInfo(
              info,
              detailsUseCase: getIt<UserDetailsUseCase>(),
            ),
          )
          .toList(),
      pageData.totalPages,
      pageData.totalElements,
      pageData.hasNext,
    );
  }
}
