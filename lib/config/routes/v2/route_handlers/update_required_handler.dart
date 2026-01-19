import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/version_service/i_version_service.dart';

class UpdateRequiredHandler extends RouteHandler {
  late final ProviderSubscription<AsyncValue<LoginMobileInfo>> _subscription;
  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    _subscription = ref.listenManual(oauthProvider, (prev, next) async  {
      final versionInfo = next.value?.versionInfo;
      if (versionInfo != null) {
        if (getIt<IVersionService>().appUpdateRequired(versionInfo)) {
          await ref.read(loginProvider.notifier).logout();
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription.close();
  }
}
