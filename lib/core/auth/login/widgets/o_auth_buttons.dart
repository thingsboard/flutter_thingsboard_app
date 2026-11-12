// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/o_auth_button.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/material_icons.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class OAuthButtons extends StatelessWidget {
  const OAuthButtons({
    super.key,
    required this.clients,
    required this.onButtonPressed,
  });
  final void Function(OAuth2ClientLoginInfo) onButtonPressed;
  final List<OAuth2ClientLoginInfo> clients;
  @override
  Widget build(BuildContext context) {
    return clients.length == 1 && clients.first.name == 'qr'
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OAuthButton(
                logo: SvgPicture.asset(
                  ThingsboardImage.oauth2Logos['qr-code-logo']!,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () => onButtonPressed(clients.first),
                title: S.of(context).scanQrCode,
              ),
            ],
          )
        : _rows(context);
  }

  /// At most [_maxPerRow] buttons share a row, narrowing to fit. More of them
  /// wrap into rows of equal length, so nine make five and four rather than
  /// eight and one.
  Widget _rows(BuildContext context) {
    // While the login info loads there are none. An empty Column would count
    // one gap less than no gaps, making the page measure itself too short.
    if (clients.isEmpty) {
      return const SizedBox.shrink();
    }
    final rowCount = (clients.length / _maxPerRow).ceil();
    final perRow = (clients.length / rowCount).ceil();
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: _spacing,
      children: [
        for (var i = 0; i < clients.length; i += perRow)
          _row(context, clients.skip(i).take(perRow).toList(), perRow),
      ],
    );
  }

  /// A row laid out as if it held [perRow] buttons: a shorter last row keeps
  /// the button size of the full rows and sits in the middle.
  Widget _row(
    BuildContext context,
    List<OAuth2ClientLoginInfo> row,
    int perRow,
  ) {
    // Every missing button frees its width and one gap, half on each side of
    // the row. A button has a flex of 2, so half of its width is a flex of 1.
    final missing = perRow - row.length;
    return Row(
      children: [
        if (missing > 0) ...[
          Spacer(flex: missing),
          SizedBox(width: missing * _spacing / 2),
        ],
        for (final (i, client) in row.indexed) ...[
          if (i > 0) const SizedBox(width: _spacing),
          Expanded(
            flex: 2,
            child: OAuthButton(
              logo: _getOauth2ButtonLogo(context, client),
              onTap: () => onButtonPressed(client),
            ),
          ),
        ],
        if (missing > 0) ...[
          SizedBox(width: missing * _spacing / 2),
          Spacer(flex: missing),
        ],
      ],
    );
  }
}

/// The most buttons in one row. Eight still show a full-size logo on a phone
/// 320 wide.
const _maxPerRow = 8;

/// The gap between buttons, across and down.
const _spacing = 10.0;

// Single-color brand marks; drawn in the foreground so they stay visible on
// the primary palette. Multicolor logos (Google, Facebook) keep their colors.
const _monochromeLogos = {'github-logo', 'apple-logo', 'qr-code'};

Widget _getOauth2ButtonLogo(BuildContext context, OAuth2ClientLoginInfo info) {
  final String? svgPath = ThingsboardImage.oauth2Logos[info.icon];

  if (svgPath != null) {
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        svgPath,
        colorFilter: _monochromeLogos.contains(info.icon)
            ? ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }

  final iconData = iconFromString(info.icon);

  return SizedBox(width: 24, height: 24, child: Icon(iconData));
}
