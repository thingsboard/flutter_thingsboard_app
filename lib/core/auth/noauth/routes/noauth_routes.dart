import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/view/switch_endpoint_noauth_view.dart';

class NoAuthRoutes extends TbRoutes {
  NoAuthRoutes(super.tbContext);

  static const noAuthPageRoutes = '/api/noauth/qr';

  late final noAuthQrHandler = Handler(
    handlerFunc: (context, params) {
      final rawArgs = context?.settings?.arguments as Map<String, dynamic>?;
     final args =  rawArgs == null ? null:  SwitchEndpointArgs.fromJson(rawArgs);

      return SwitchEndpointNoAuthView(
        tbContext,
        arguments: args,
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(noAuthPageRoutes, handler: noAuthQrHandler);
  }
}
