import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handlers.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class RouteHanlderWidget extends HookConsumerWidget {
  const RouteHanlderWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        subscrbeHandlers(context, ref);
      });
      return () => disposeHandlers();
    }, []);
    return PopScope(
      onPopInvokedWithResult: (didPop, res) {
        if (!context.canPop()) {
          SystemNavigator.pop();
        }
      },
      canPop: false,
      child: ReactiveFormConfig(validationMessages: {
             PhoneValidationMessage.required: (error) => S.of(context).phoneIsRequired,
      PhoneValidationMessage.invalidCountry: (error) => S.of(context).phoneIsInvalid,
      PhoneValidationMessage.invalidFixedLinePhoneNumber: (error) => S.of(context).phoneIsInvalid,
      PhoneValidationMessage.invalidMobilePhoneNumber: (error) => S.of(context).phoneIsInvalid,
      PhoneValidationMessage.invalidPhoneNumber: (error) => S.of(context).phoneIsInvalid,
      },child: child,
      ),
    );
  }
}

void subscrbeHandlers(BuildContext context, WidgetRef ref) {
  for (final handler in routeHandlers) {
    handler.init(context, ref);
  }
}

void disposeHandlers() {
  for (final handler in routeHandlers) {
    handler.dispose();
  }
}
