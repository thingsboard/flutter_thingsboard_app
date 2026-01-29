import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';

import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/noauth_loading_widget.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';

class SwitchEndpointNoAuthView extends HookConsumerWidget {
  const SwitchEndpointNoAuthView({required this.arguments, super.key});
  final SwitchEndpointArgs? arguments;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noAuth = ref.watch(noauthProviderProvider);
    useEffect(() {
              ref.invalidate(noauthProviderProvider);
      if (arguments != null) {
        ref
            .read(noauthProviderProvider.notifier)
            .switchEndpoint(SwitchEndpointParams(data: arguments!));
      }
      return null;
    }, []);
    ref.listen(noauthProviderProvider, (prev, next) {
      if (next.error != null) {
        Future.delayed(const Duration(seconds: 5), () {
          if (context.mounted) {
            context.pop();
          }
        });
      }
      if (next.isDone) {

      }
    });
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (noAuth.error != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 50),
                      const SizedBox(height: 10),
                      Text(
                        noAuth.error.toString(),
                        //S.of(context).somethingWentWrongRollback,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const NoAuthLoadingWidget(),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 80,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            noAuth.message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
