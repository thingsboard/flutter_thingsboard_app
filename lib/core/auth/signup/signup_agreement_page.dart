// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

enum SignUpAgreement { privacyPolicy, termsOfUse }

/// Shows the server's privacy policy or terms of use and pops with `true`
/// when the user accepts it, `false` when they cancel.
class SignUpAgreementPage extends StatefulWidget {
  const SignUpAgreementPage({required this.agreement, super.key});

  final SignUpAgreement agreement;

  @override
  State<StatefulWidget> createState() => _SignUpAgreementPageState();
}

class _SignUpAgreementPageState extends State<SignUpAgreementPage> {
  late Future<String?> agreementFuture;

  @override
  void initState() {
    super.initState();
    final api = getIt<ITbClientService>().client
        .getSelfRegistrationControllerApi();
    final pkgName = getIt<IDeviceInfoService>().getApplicationId();
    final platform = getIt<IDeviceInfoService>().getPlatformType();
    final response = switch (widget.agreement) {
      SignUpAgreement.privacyPolicy => api.getPrivacyPolicy(
        pkgName: pkgName,
        platform: platform,
      ),
      SignUpAgreement.termsOfUse => api.getTermsOfUse(
        pkgName: pkgName,
        platform: platform,
      ),
    };
    agreementFuture = response.then((r) => r.data);
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (widget.agreement) {
      SignUpAgreement.privacyPolicy => S.of(context).privacyPolicy,
      SignUpAgreement.termsOfUse => S.of(context).termsOfUse,
    };
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(title: Text(title)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: FutureBuilder<String?>(
                    future: agreementFuture,
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
                        return const Center(
                          child: TbProgressIndicator(size: 50.0),
                        );
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
                    onPressed: () =>
                        getIt<ThingsboardAppRouter>().pop(false, context),
                    child: Text(S.of(context).cancel),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        getIt<ThingsboardAppRouter>().pop(true, context),
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
