import 'package:flutter/material.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';

class MorePageFooter extends StatelessWidget {
  const MorePageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      versionInfo(),
      appVersionInfo(),
    ]);
  }
   Widget versionInfo() {
    return const SizedBox();
  }

  Widget appVersionInfo() {
    final ver = getIt<IDeviceInfoService>().getBuildVersion();
    if (EnvironmentVariables.showAppVersion) {
      // translate-me-ignore-next-line
      return Text('version: $ver');
    }
    return const SizedBox();
  }
}
