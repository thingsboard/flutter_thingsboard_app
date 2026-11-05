import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

class MorePageFooter extends ConsumerWidget {
  const MorePageFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wl = ref.watch(wlProvider);
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        direction: wl.showNameBottom ?? false ? Axis.horizontal : Axis.vertical,
        alignment: WrapAlignment.spaceBetween,
        children: [
          if ((wl.showNameVersion ?? false) &&
              wl.platformNameAndVersion.isNotEmpty)
            Text(wl.platformNameAndVersion,  style: TbTextStyles.bodyMedium),
          appVersionInfo(),
        ],
      ),
    );
  }

  Widget appVersionInfo() {
    final ver = getIt<IDeviceInfoService>().getBuildVersion();
    if (EnvironmentVariables.showAppVersion) {
      // translate-me-ignore-next-line
      return Text('version: $ver',  style: TbTextStyles.bodyMedium);
    }
    return const SizedBox();
  }
}
