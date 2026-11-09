// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';

class SelectRegionScreen extends HookConsumerWidget {
  const SelectRegionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    Future<void> select(Region region) async {
      if (loading.value) return;
      loading.value = true;
      await onChangeEndpoint(region, ref);
      if (context.mounted) loading.value = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SvgPicture.asset(ThingsboardImage.thingsboardBigLogo),
                const SizedBox(height: 166),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).selectRegion,
                          style: TbTextStyles.titleMedium.copyWith(
                            color: Colors.black.withValues(alpha: .76),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => select(Region.northAmerica),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              textStyle: TbTextStyles.labelMedium,
                            ),
                            child: Text(S.of(context).northAmerica),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => select(Region.europe),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              textStyle: TbTextStyles.labelMedium,
                            ),
                            child: Text(S.of(context).europe),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedVisibilityWidget(
            show: loading.value,
            child: const FullScreenLoader(),
          ),
        ],
      ),
    );
  }
}

Future<void> onChangeEndpoint(Region region, WidgetRef ref) async {
  // ChooseRegionScreen calls this from onPopInvoked, so its ref is disposed
  // before the client re-init completes; the container outlives it.
  final container = ProviderScope.containerOf(ref.context, listen: false);
  await getIt<IEndpointService>().setRegion(region);
  final newEndpoint = await getIt<IEndpointService>().getEndpoint();
  try {
    await getIt<ITbClientService>().reInit(
      endpoint: newEndpoint,
      onDone: () {},
      onAuthError: (error) {},
    );
    await container.read(wlProvider.notifier).updateWhiteLabeling();
  } catch (e, s) {
    // An unreachable server must not keep the user on this screen: the
    // client reports the error and the login page shows what it can load.
    getIt<TbLogger>().error('Region switch: client re-init failed', e, s);
  }
  // The login info (OAuth clients, cloud self-registration) was fetched for
  // the previous endpoint, or for none before the first region choice.
  container.invalidate(oauthProvider);
  getIt<ThingsboardAppRouter>().navigateTo('/');
}
