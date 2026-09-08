import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/view/switch_endpoint_noauth_view.dart';

const noAuthPath = '/api/noauth/qr';
// NoAuth routes
final List<GoRoute> noAuthRoutes = [
  GoRoute(
    path: noAuthPath,
    builder: (context, state) {
      // A link without a secret (e.g. the app QR from the login page) is
      // still a valid host switch, so parse arguments in both cases. App links
      // already carry the original link under `appLinkUriQueryParam`; an
      // in-app navigation to this route does not, so fall back to the location
      // we were opened with.
      final scannedLink =
          state.uri.queryParameters[appLinkUriQueryParam] ??
          state.uri.toString();

      return SwitchEndpointNoAuthView(
        arguments: SwitchEndpointArgs.fromJson({
          ...state.uri.queryParameters,
          'uri': scannedLink,
        }),
      );
    },
  ),
];
