import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';

abstract class TbRoutes {

  TbRoutes(this._tbContext);
  final TbContext _tbContext;

  void registerRoutes() {
    doRegisterRoutes(getIt<ThingsboardAppRouter>().router);
  }

  void doRegisterRoutes(FluroRouter router);

  TbContext get tbContext => _tbContext;
}
