
import 'package:thingsboard_app/config/routes/v2/route_handlers/home_handler.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/two_factor_confirm_handler.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/two_factor_setup_handler.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/update_required_handler.dart';


final routeHandlers = [
UpdateRequiredHandler(),
TwoFactorConfirmHandler(),
TwoFactorSetupHandler(),
HomeHandler(),
];
