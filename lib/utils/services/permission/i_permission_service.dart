import 'package:thingsboard_app/core/context/tb_context.dart';

abstract interface class IPermissionService {
  bool haveViewDashboardPermission(TbContext context);
}
