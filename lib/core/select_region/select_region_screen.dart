// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

class SelectRegionScreen extends ConsumerWidget {
  const SelectRegionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
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
                        onPressed: () async {
                          await onChangeEndpoint(Region.northAmerica, ref);
                        },
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
                        onPressed: () async {
                          await onChangeEndpoint(Region.europe, ref);
                        },
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
    );
  }
}

Future<void> onChangeEndpoint(Region region, WidgetRef ref) async {
  getIt<IEndpointService>().setRegion(region);
  final newEndpoint = await getIt<IEndpointService>().getEndpoint();
  getIt<ITbClientService>().reInit(
    endpoint: newEndpoint,
    onDone: () {},
    onAuthError: (error) {},
  );
 await  ref.read(wlProvider.notifier).updateWhiteLabeling();
  getIt<ThingsboardAppRouter>().navigateTo('/');
}
