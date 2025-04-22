import 'package:fluro/fluro.dart' show TransitionType;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
    show MdiIcons;
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/features/authentication/entities/entities.dart'
    show Oauth2Entity;
import 'package:thingsboard_app/utils/ui/build_context_extension.dart';

class Oauth2ClientsWidget extends StatelessWidget {
  Oauth2ClientsWidget(this.oauth2Clients, {required this.onPressed, super.key});

  final List<Oauth2Entity> oauth2Clients;
  final Function(Oauth2Entity) onPressed;

  late final _oauth2IconButtonStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.all(16),
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    if (oauth2Clients.isNotEmpty) {
      return Row(
        children: [
          ...List.generate(
            oauth2Clients.length,
            (index) {
              Widget? icon;
              final isLast = index == oauth2Clients.length - 1;
              final client = oauth2Clients[index];

              if (client.icon != null) {
                if (ThingsboardImage.oauth2Logos.containsKey(client.icon)) {
                  icon = SvgPicture.asset(
                    ThingsboardImage.oauth2Logos[client.icon]!,
                    height: 24,
                  );
                } else {
                  String strIcon = client.icon!;
                  if (strIcon.startsWith('mdi:')) {
                    strIcon = strIcon.substring(4);
                  }
                  var iconData = MdiIcons.fromString(strIcon);
                  if (iconData != null) {
                    icon = Icon(
                      iconData,
                      size: 24,
                      color: Theme.of(context).primaryColor,
                    );
                  }
                }
              }

              icon ??= Icon(
                Icons.login,
                size: 24,
                color: Theme.of(context).primaryColor,
              );
              final button = OutlinedButton(
                style: _oauth2IconButtonStyle,
                onPressed: () => onPressed(client),
                child: icon,
              );

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : 8),
                  child: button,
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton(
              style: _oauth2IconButtonStyle,
              onPressed: () => _scanQrCode(context),
              child: SvgPicture.asset(
                ThingsboardImage.oauth2Logos['qr-code']!,
                height: 24,
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: _oauth2IconButtonStyle,
          onPressed: () => _scanQrCode(context),
          child: Row(
            children: [
              SvgPicture.asset(
                ThingsboardImage.oauth2Logos['qr-code-logo']!,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).scanQrCode,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _scanQrCode(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus();
      final barcode = await context.navigateTo(
        '/qrCodeScan',
        transition: TransitionType.nativeModal,
      );

      if (barcode != null && barcode.code != null) {
        if (context.mounted) {
          await context.navigateByAppLink(barcode.code);
        }
      }
    } catch (_) {}
  }
}
