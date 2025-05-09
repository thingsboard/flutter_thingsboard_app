import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/permission/i_permission_service.dart';

class PermissionService implements IPermissionService {
  @override
  bool haveViewDashboardPermission(TbContext context) {
    return context.hasGenericPermission(
          Resource.WIDGETS_BUNDLE,
          Operation.READ,
        ) &&
        context.hasGenericPermission(
          Resource.WIDGET_TYPE,
          Operation.READ,
        ) &&
        context.hasGenericPermission(
          Resource.DASHBOARD,
          Operation.READ,
        ) &&
        context.hasGenericPermission(
          Resource.DASHBOARD_GROUP,
          Operation.READ,
        );
  }
}
