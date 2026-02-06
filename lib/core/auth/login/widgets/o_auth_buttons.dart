import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/o_auth_button.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class OAuthButtons extends StatelessWidget {
  const OAuthButtons({
    super.key,
    required this.clients,
    required this.onButtonPressed,
  });
  final void Function(OAuth2ClientInfo) onButtonPressed;
  final List<OAuth2ClientInfo> clients;
  @override
  Widget build(BuildContext context) {
    return clients.length == 1 && clients.first.name == 'qr'
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OAuthButton(
              logo: SvgPicture.asset(
                ThingsboardImage.oauth2Logos['qr-code-logo']!,
              ),
              onTap: () => onButtonPressed(clients.first),
              title: S.of(context).scanQrCode,
            ),
          ],
        )
        : Row(
          spacing: 10,
          children:
              clients
                  .map(
                    (e) => Expanded(
                      child: OAuthButton(
                        logo: getOauth2ButtonLogo(e),
                        onTap: () => onButtonPressed(e),
                      ),
                    ),
                  )
                  .toList(),
        );
  }
}

Widget getOauth2ButtonLogo(OAuth2ClientInfo info) {
  return SizedBox(
    width: 24,
    height: 24,
    child: SvgPicture.asset(ThingsboardImage.oauth2Logos[info.icon]!),
  );
}
