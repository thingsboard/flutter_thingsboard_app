import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/view/switch_endpoint_noauth_view.dart';

const noAuthPath = '/api/noauth/qr';
// NoAuth routes
final List<GoRoute> noAuthRoutes = [
  GoRoute(
    path: noAuthPath,
    builder: (context, state) {
      // Try to get secret from query parameters
      final secret = state.uri.queryParameters['secret'];

      if (secret == null) {
        return const SwitchEndpointNoAuthView(arguments: null);
      }

      // Create arguments from query parameters
      final args = SwitchEndpointArgs.fromJson(state.uri.queryParameters);

      return SwitchEndpointNoAuthView(arguments: args);
    },
  ),
];
