// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/core/select_region/region_widget.dart';
import 'package:thingsboard_app/core/select_region/select_region_screen.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class ChooseRegionScreen extends HookConsumerWidget {
  const ChooseRegionScreen({super.key, required this.selectedRegion});
  final Region selectedRegion;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRegion = useState(selectedRegion);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) onChangeEndpoint(currentRegion.value, ref);
      },
      child: Scaffold(
        appBar: TbAppBar(
          title: Text(
            S.of(context).chooseRegion,
            style: TbTextStyles.titleXs.copyWith(
              color: Colors.black.withValues(alpha: .87),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegionWidget(
                title: S.of(context).northAmerica,
                subTitle: S.of(context).northAmericaRegionShort,
                selected: currentRegion.value == Region.northAmerica,
                onTap: () {
                  currentRegion.value = Region.northAmerica;
                  
                },
              ),
              Container(
                height: 1,
                decoration: const BoxDecoration(color: AppColors.bordersLight),
              ),
              RegionWidget(
                title: S.of(context).europe,
                subTitle: S.of(context).europeRegionShort,
                selected: currentRegion.value == Region.europe,
                onTap: () {
                     currentRegion.value = Region.europe;
                  
                },
              ),
              if (selectedRegion == Region.custom) ...[
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColors.bordersLight,
                  ),
                ),
                RegionWidget(
                  title: 'Custom',
                  subTitle:
                      Uri.parse(
                        getIt<IEndpointService>().getCachedEndpoint(),
                      ).host,
                  selected: currentRegion.value == Region.custom,
                  onTap: () {
                       currentRegion.value = Region.custom;

                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
