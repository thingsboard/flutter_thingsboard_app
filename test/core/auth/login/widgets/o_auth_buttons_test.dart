// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/o_auth_button.dart';
import 'package:thingsboard_app/core/auth/login/widgets/o_auth_buttons.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

List<OAuth2ClientLoginInfo> clients(int count) => [
  for (var i = 0; i < count; i++)
    OAuth2ClientLoginInfo(
      (c) => c
        ..name = 'client$i'
        ..icon = 'github-logo'
        ..url = '/oauth2/authorization/client$i',
    ),
];

void main() {
  /// The login page gives the buttons the screen width minus 16 on each side:
  /// 361 on a 393 pt wide iPhone 15.
  Future<void> pumpButtons(
    WidgetTester tester,
    List<OAuth2ClientLoginInfo> clients, {
    double width = 361,
    void Function(OAuth2ClientLoginInfo)? onButtonPressed,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: width,
              child: OAuthButtons(
                clients: clients,
                onButtonPressed: onButtonPressed ?? (_) {},
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The logo of button [index] as drawn on screen, scaling included.
  Rect logo(WidgetTester tester, int index) =>
      tester.getRect(find.byType(SvgPicture).at(index));

  Rect button(WidgetTester tester, int index) =>
      tester.getRect(find.byType(OAuthButton).at(index));

  testWidgets('five buttons show their logos at 24 pt', (tester) async {
    await pumpButtons(tester, clients(5));

    for (var i = 0; i < 5; i++) {
      expect(logo(tester, i).width, closeTo(24, 0.01));
      expect(logo(tester, i).height, closeTo(24, 0.01));
    }
  });

  // Six buttons get 51.8 each: less than a logo with 16 of padding on each
  // side, which used to overflow by 4.2.
  testWidgets('six buttons fit one row with full-size logos', (tester) async {
    await pumpButtons(tester, clients(6));

    expect(tester.takeException(), isNull);
    for (var i = 0; i < 6; i++) {
      expect(button(tester, i).top, 0);
      expect(logo(tester, i).width, closeTo(24, 0.01));
      expect(logo(tester, i).height, closeTo(24, 0.01));
    }
  });

  testWidgets('a logo stays in the middle of a narrow button', (tester) async {
    await pumpButtons(tester, clients(6));

    for (var i = 0; i < 6; i++) {
      expect(
        logo(tester, i).center.dx,
        closeTo(button(tester, i).center.dx, 0.01),
      );
    }
  });

  testWidgets('eight buttons stay on one row', (tester) async {
    await pumpButtons(tester, clients(8));

    expect(tester.takeException(), isNull);
    // Eight buttons and seven gaps of 10 in 361: (361 - 70) / 8.
    for (var i = 0; i < 8; i++) {
      expect(button(tester, i).top, 0);
      expect(button(tester, i).width, closeTo(36.38, 0.01));
      expect(logo(tester, i).width, closeTo(24, 0.01));
    }
  });

  // A folded phone's cover screen: 280 wide, 248 for the buttons.
  testWidgets('buttons narrower than a logo scale it down to their width', (
    tester,
  ) async {
    await pumpButtons(tester, clients(8), width: 248);

    expect(tester.takeException(), isNull);
    // Eight buttons and seven gaps of 10 in 248: (248 - 70) / 8.
    for (var i = 0; i < 8; i++) {
      expect(button(tester, i).width, closeTo(22.25, 0.01));
      expect(logo(tester, i).width, closeTo(22.25, 0.01));
      expect(logo(tester, i).height, closeTo(22.25, 0.01));
    }
  });

  testWidgets('nine buttons wrap into rows of five and four', (tester) async {
    await pumpButtons(tester, clients(9));

    expect(tester.takeException(), isNull);
    final height = button(tester, 0).height;
    for (var i = 0; i < 5; i++) {
      expect(button(tester, i).top, 0);
    }
    for (var i = 5; i < 9; i++) {
      expect(button(tester, i).top, height + 10);
    }
  });

  testWidgets('wrapped buttons all have the size of a full row', (
    tester,
  ) async {
    await pumpButtons(tester, clients(9));

    // Five buttons and four gaps of 10 in 361: (361 - 40) / 5.
    for (var i = 0; i < 9; i++) {
      expect(button(tester, i).width, closeTo(64.2, 0.01));
      expect(button(tester, i).height, button(tester, 0).height);
      expect(logo(tester, i).width, closeTo(24, 0.01));
    }
  });

  testWidgets('a shorter last row sits in the middle', (tester) async {
    await pumpButtons(tester, clients(9));

    expect(
      button(tester, 5).left,
      closeTo(361 - button(tester, 8).right, 0.01),
    );
    for (var i = 6; i < 9; i++) {
      expect(
        button(tester, i).left - button(tester, i - 1).right,
        closeTo(10, 0.01),
      );
    }
  });

  testWidgets('sixteen buttons fill two rows of eight', (tester) async {
    await pumpButtons(tester, clients(16));

    final height = button(tester, 0).height;
    for (var i = 0; i < 16; i++) {
      expect(button(tester, i).top, i < 8 ? 0 : height + 10);
      expect(button(tester, i).width, closeTo(36.38, 0.01));
    }
  });

  testWidgets('seventeen buttons wrap into rows of six, six and five', (
    tester,
  ) async {
    await pumpButtons(tester, clients(17));

    expect(tester.takeException(), isNull);
    final height = button(tester, 0).height;
    for (var i = 0; i < 17; i++) {
      expect(button(tester, i).top, (i ~/ 6) * (height + 10));
      // Six buttons and five gaps of 10 in 361: (361 - 50) / 6.
      expect(button(tester, i).width, closeTo(51.83, 0.01));
    }
  });

  testWidgets('no buttons take no room', (tester) async {
    await pumpButtons(tester, []);

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(OAuthButtons)).height, 0);
  });

  testWidgets('the lone QR code button keeps 16 around its logo and title', (
    tester,
  ) async {
    await pumpButtons(tester, [qrCode]);

    expect(logo(tester, 0).left - button(tester, 0).left, 16);
    expect(
      button(tester, 0).right - tester.getRect(find.text('Scan QR code')).right,
      16,
    );
  });

  testWidgets('a wrapped button signs in with its own client', (tester) async {
    final pressed = <String?>[];
    await pumpButtons(
      tester,
      clients(13),
      onButtonPressed: (client) => pressed.add(client.name),
    );

    await tester.tap(find.byType(OAuthButton).at(11));

    expect(pressed, ['client11']);
  });
}
