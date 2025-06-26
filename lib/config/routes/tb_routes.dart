import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

abstract class TbRoutes {
  final TbContext _tbContext;

  TbRoutes(this._tbContext);

  void registerRoutes() {
    doRegisterRoutes(_tbContext.router);
  }

  void doRegisterRoutes(FluroRouter router);

  TbContext get tbContext => _tbContext;
}
