import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/services/i_service_has_resource.dart';

abstract interface class ILegacyService implements IServiceHasResource {
  @Deprecated(
    'The purpose of this service is to ensure a smooth transition between the new and the legacy app architectures. '
    'Once the new architecture is fully adopted across the project, this service should be removed.',
  )
  Future<void> initTbContext();

  @Deprecated(
    'TbContext must be deleted in the future releases, '
    'and code which uses it should be rewritten to use Bloc with services.',
  )
  TbContext get tbContext;
}
