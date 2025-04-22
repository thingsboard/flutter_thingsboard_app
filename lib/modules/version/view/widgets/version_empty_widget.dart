import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/features/authentication/presentation/widgets/login_page_background.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionEmptyWidget extends StatelessWidget {
  const VersionEmptyWidget({
    required this.storeLink,
    required this.latestVersion,
    super.key,
  });

  final String? storeLink;
  final String latestVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const LoginPageBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    S.of(context).updateRequired,
                    style: TbTextStyles.titleLarge,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: storeLink?.isNotEmpty == true,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrlString(
                            storeLink!,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          S.of(context).updateTo(latestVersion),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
