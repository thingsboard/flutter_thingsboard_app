import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class LoginPage extends TbPageWidget<LoginPage, _LoginPageState> {

  LoginPage(TbContext tbContext) : super(tbContext);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends TbPageState<LoginPage, _LoginPageState> {

  final ButtonStyle _oauth2ButtonWithTextStyle =
        OutlinedButton.styleFrom(alignment: Alignment.centerLeft, primary: Colors.black87);

  final ButtonStyle _oauth2IconButtonStyle =
        OutlinedButton.styleFrom(alignment: Alignment.center);

  final _isLoginNotifier = ValueNotifier<bool>(false);
  final _showPasswordNotifier = ValueNotifier<bool>(false);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: ValueListenableBuilder<bool>(
            valueListenable: _isLoginNotifier,
            builder: (BuildContext context, bool loading, child) {
              List<Widget> children = [
                LoginPageBackground(),
                Positioned.fill(
                  child: LayoutBuilder(
                     builder: (context, constraints) {
                       return SingleChildScrollView(
                           padding: EdgeInsets.fromLTRB(28, 71, 28, 28),
                           child: ConstrainedBox(
                             constraints: BoxConstraints(minHeight: constraints.maxHeight - (71 + 28)),
                             child: IntrinsicHeight(
                                 child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.stretch,
                                     children: [
                                       Row(
                                           children: [
                                             SvgPicture.asset(ThingsboardImage.thingsBoardWithTitle,
                                                 height: 25,
                                                 color: Theme.of(context).primaryColor,
                                                 semanticsLabel: 'ThingsBoard Logo')
                                           ]
                                       ),
                                       Container(height: 32),
                                       Row(
                                           children: [
                                             Text(
                                                 'Login to your account',
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 28,
                                                     height: 36 / 28
                                                 )
                                             )]
                                       ),
                                       Container(height: 48),
                                       if (tbContext.hasOAuthClients)
                                         _buildOAuth2Buttons(tbContext.oauth2Clients!),
                                       if (tbContext.hasOAuthClients)
                                         Padding(padding: EdgeInsets.only(top: 10, bottom: 16),
                                             child:  Row(
                                               children: [
                                                 Flexible(child: Divider()),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(horizontal: 16),
                                                   child: Text('OR'),
                                                 ),
                                                 Flexible(child: Divider())
                                               ],
                                             )
                                         ),
                                       TextField(
                                         enabled: !loading,
                                         controller: usernameController,
                                         decoration: InputDecoration(
                                             border: OutlineInputBorder(),
                                             labelText: 'Email',
                                             hintText: 'Enter valid email id as abc@gmail.com'),
                                       ),
                                       Container(height: 28),
                                       ValueListenableBuilder(
                                           valueListenable: _showPasswordNotifier,
                                           builder: (BuildContext context, bool showPassword, child) {
                                             return TextField(
                                               enabled: !loading,
                                               controller: passwordController,
                                               obscureText: !showPassword,
                                               decoration: InputDecoration(
                                                   suffixIcon: IconButton(
                                                     icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                                                     onPressed: loading ? null : () {
                                                       _showPasswordNotifier.value = !_showPasswordNotifier.value;
                                                     },
                                                   ),
                                                   border: OutlineInputBorder(),
                                                   labelText: 'Password',
                                                   hintText: 'Enter secure password'),
                                             );
                                           }
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           TextButton(
                                             onPressed: loading ? null : () {
                                               //TODO FORGOT PASSWORD SCREEN GOES HERE
                                             },
                                             child: Text(
                                               'Forgot Password?',
                                               style: TextStyle(color: loading ? Colors.black12 : Theme.of(context).colorScheme.primary,
                                                   letterSpacing: 1,
                                                   fontSize: 12,
                                                   height: 16 / 12),
                                             ),
                                           )
                                         ],
                                       ),
                                       Spacer(),
                                       ElevatedButton(
                                         child: Text('Log In'),
                                         style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                                         onPressed: loading ? null : () async {
                                           _isLoginNotifier.value = true;
                                           try {
                                             await tbClient.login(
                                                 LoginRequest(usernameController.text,
                                                     passwordController.text));
                                           } catch (e) {
                                             _isLoginNotifier.value = false;
                                           }
                                         },
                                       ),
                                       Container(
                                         height: 24,
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text('New User?',
                                               style: TextStyle(
                                                   fontSize: 14,
                                                   height: 14 / 20
                                               )),
                                           TextButton(
                                             onPressed: loading ? null : () {
                                               //TODO CREATE ACCOUNT SCREEN GOES HERE
                                             },
                                             child: Text(
                                               'Create Account',
                                               style: TextStyle(color: loading ? Colors.black12 : Theme.of(context).colorScheme.primary,
                                                   letterSpacing: 1,
                                                   fontSize: 14,
                                                   height: 14 / 20),
                                             ),
                                           )
                                         ],
                                       )
                                     ]
                                 ),
                             )
                           )
                       );
                     },
                  )


                )
              ];
              if (loading) {
                var data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
                var bottomPadding = data.padding.top;
                bottomPadding += kToolbarHeight;
                children.add(
                    SizedBox.expand(
                        child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.grey.shade200.withOpacity(0.2)
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: bottomPadding),
                                      alignment: Alignment.center,
                                      child: TbProgressIndicator(size: 50.0),
                                  ),
                                )
                            )
                        )
                    )
                );
              }
              return Stack(
                children: children,
              );
        })
    );
  }

  Widget _buildOAuth2Buttons(List<OAuth2ClientInfo> clients) {
    if (clients.length == 1 || clients.length > 6) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: clients.asMap().map((index, client) =>
            MapEntry(index, _buildOAuth2Button(client, 'Login with ${client.name}', false, index == clients.length - 1))).values.toList()
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: Text('LOGIN WITH')),
          ),
          Row(
            children: clients.asMap().map((index, client) =>
                MapEntry(index, _buildOAuth2Button(client, clients.length == 2 ? client.name : null, true, index == clients.length - 1))).values.toList()
          )
        ],
      );
    }
  }

  Widget _buildOAuth2Button(OAuth2ClientInfo client,
                            String? text,
                            bool expand,
                            bool isLast) {
    Widget? icon;
    if (client.icon != null) {
      if (ThingsboardImage.oauth2Logos.containsKey(client.icon)) {
        icon = SvgPicture.asset(ThingsboardImage.oauth2Logos[client.icon]!,
            height: 24);
      } else {
        String strIcon = client.icon!;
        if (strIcon.startsWith('mdi:')) {
          strIcon = strIcon.substring(4);
        }
        var iconData = MdiIcons.fromString(strIcon);
        if (iconData != null) {
          icon = Icon(iconData, size: 24, color: Theme.of(context).primaryColor);
        }
      }
    }
    if (icon == null) {
      icon = Icon(Icons.login, size: 24, color: Theme.of(context).primaryColor);
    }
    Widget button;
    bool iconOnly = text == null;
    if (iconOnly) {
      button = OutlinedButton(
          style: _oauth2IconButtonStyle,
          onPressed: () => _oauth2ButtonPressed(client),
          child: icon);
    } else {
      button = OutlinedButton.icon(
          style: _oauth2ButtonWithTextStyle,
          onPressed: () => _oauth2ButtonPressed(client),
          icon: icon,
          label: Expanded(child: Text(text, textAlign: TextAlign.center)));
    }
    if (expand) {
      return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 8),
            child: button,
          )
      );
    } else {
      return button;
    }
  }

  void _oauth2ButtonPressed(OAuth2ClientInfo client) async {
    _isLoginNotifier.value = true;
    var url = Uri.parse(ThingsboardAppConstants.thingsBoardApiEndpoint + client.url);
    var params = Map<String,String>.from(url.queryParameters);
    params['pkg'] = tbContext.packageName;
    url = url.replace(queryParameters: params);
    try {
      final result = await FlutterWebAuth.authenticate(
          url: url.toString(),
          callbackUrlScheme: ThingsboardAppConstants.thingsboardOAuth2CallbackUrlScheme);
      final resultUri = Uri.parse(result);
      final error = resultUri.queryParameters['error'];
      if (error != null) {
        _isLoginNotifier.value = false;
        showErrorNotification(error);
      } else {
        final accessToken = resultUri.queryParameters['accessToken'];
        final refreshToken = resultUri.queryParameters['refreshToken'];
        if (accessToken != null && refreshToken != null) {
          await tbClient.setUserFromJwtToken(accessToken, refreshToken, true);
        }
      }
      log.debug('result = $result');
    } catch (e) {
      log.error('Auth Error:', e);
      _isLoginNotifier.value = false;
    }
  }
}

class LoginPageBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: CustomPaint(
          painter: _LoginPageBackgroundPainter(color: Theme.of(context).primaryColor),
        )
    );
  }

}

class _LoginPageBackgroundPainter extends CustomPainter {

  final Color color;

  const _LoginPageBackgroundPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withAlpha(14);
    paint.style = PaintingStyle.fill;
    var topPath = Path();
    topPath.moveTo(0, 0);
    topPath.lineTo(size.width / 2, 0);
    topPath.lineTo(0, size.height / 10);
    topPath.close();
    canvas.drawPath(topPath, paint);
    var bottomPath = Path();
    bottomPath.moveTo(0, size.height * 0.98);
    bottomPath.lineTo(size.width, size.height * 0.78);
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant _LoginPageBackgroundPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
