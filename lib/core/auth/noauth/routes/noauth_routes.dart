import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/view/switch_endpoint_noauth_view.dart';

class NoAuthRoutes extends TbRoutes {
  NoAuthRoutes(super.tbContext);

  static const noAuthPageRoutes = '/api/noauth/qr';

  late final noAuthQrHandler = Handler(
    handlerFunc: (context, params) {
      print('SwitchEndpointNoAuthView $params');

      return SwitchEndpointNoAuthView(
        tbContext: tbContext,
        arguments: context?.settings?.arguments as Map<String, dynamic>?,
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    print('NoAuthRoutes:doRegisterRoutes()');
    router.define(noAuthPageRoutes, handler: noAuthQrHandler);
  }
}
