import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

/// The platform can deliver the same intent more than once, back to back.
/// Consecutive duplicates within this window are dropped, while a deliberate
/// re-scan of the same QR code later still goes through.
const _duplicateLinkWindow = Duration(seconds: 2);

/// Routes platform app links (e.g. the login QR code scanned with the camera
/// app) through the same [ThingsboardAppRouter.navigateByAppLink] path the
/// in-app QR scanner uses.
///
/// App links used to be handled by `TbContext.init`, which the v2 router no
/// longer calls. Owns the single subscription for the whole app: call it once,
/// from the app root.
void useAppLinks() {
  useEffect(() {
    String? lastLink;
    DateTime? lastLinkAt;

    void navigate(String link) {
      lastLink = link;
      lastLinkAt = DateTime.now();
      getIt<ThingsboardAppRouter>().navigateByAppLink(link);
    }

    final subscription = AppLinks().uriLinkStream.listen(
      (uri) {
        final link = uri.toString();
        final isDuplicate =
            link == lastLink &&
            lastLinkAt != null &&
            DateTime.now().difference(lastLinkAt!) < _duplicateLinkWindow;
        if (isDuplicate) {
          return;
        }
        navigate(link);
      },
      onError:
          (Object e) =>
              getIt<TbLogger>().error('useAppLinks: uriLinkStream $e', e),
    );

    // Consume the link the app was cold-started with (stored in main()).
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final initialLink =
          await getIt<ILocalDatabaseService>().getInitialAppLink();
      if (initialLink != null && initialLink != lastLink) {
        navigate(initialLink);
      }
    });

    return subscription.cancel;
  }, const []);
}
