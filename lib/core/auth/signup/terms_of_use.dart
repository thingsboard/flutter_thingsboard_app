// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<StatefulWidget> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  late Future<String?> termsOfUseFuture;

  @override
  void initState() {
    super.initState();
    termsOfUseFuture = getIt<ITbClientService>().client
        .getSelfRegistrationControllerApi()
        .getTermsOfUse(
          pkgName: getIt<IDeviceInfoService>().getApplicationId(),
          platform: getIt<IDeviceInfoService>().getPlatformType(),
        )
        .then((r) => r.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(title: Text(S.of(context).termsOfUse)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: FutureBuilder<String?>(
                    future: termsOfUseFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null ||
                            snapshot.data?.isEmpty == true) {
                          return const SizedBox.shrink();
                        }
                        return HtmlWidget(
                          snapshot.data ?? '',
                          onTapUrl: (link) => Utils.onWebViewLinkPressed(link),
                        );
                      } else {
                        return const Center(child: TbProgressIndicator(size: 50.0));
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed:
                        () => getIt<ThingsboardAppRouter>().pop(false, context),
                    child: Text(S.of(context).cancel),
                  ),
                  ElevatedButton(
                    onPressed:
                        () => getIt<ThingsboardAppRouter>().pop(true, context),
                    child: Text(S.of(context).accept),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
