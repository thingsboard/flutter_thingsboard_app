import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/bloc/bloc.dart';
import 'package:thingsboard_app/core/auth/login/di/login_di.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/auth/login/select_region/choose_region_screen.dart';
import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';
import 'package:thingsboard_app/core/auth/oauth2/i_oauth2_client.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class LoginPage extends TbPageWidget {
  LoginPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends TbPageState<LoginPage>
    with WidgetsBindingObserver {
  final ButtonStyle _oauth2IconButtonStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.all(16),
    alignment: Alignment.center,
  );

  final _isLoginNotifier = ValueNotifier<bool>(false);
  final _showPasswordNotifier = ValueNotifier<bool>(false);
  final IDeviceInfoService _deviceInfoService = getIt<IDeviceInfoService>();
  final IOverlayService _overlayService = getIt<IOverlayService>();
  final _loginFormKey = GlobalKey<FormBuilderState>();

  Region? selectedRegion;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    LoginDi.init();
    if (tbClient.isPreVerificationToken()) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        getIt<ThingsboardAppRouter>().navigateTo('/login/mfa');
      });
    }
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final region = await getIt<IEndpointService>().getSelectedRegion();
      if (region != null && region != Region.custom) {
        setState(() {
          selectedRegion = region;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    LoginDi.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create:
          (_) =>
              AuthBloc(tbClient: tbClient, deviceService: _deviceInfoService)
                ..add(
                  AuthFetchEvent(
                    packageName: _deviceInfoService.getApplicationId(),
                    platformType: _deviceInfoService.getPlatformType(),
                  ),
                ),
      child: Scaffold(
        body: Stack(
          children: [
            const LoginPageBackground(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                switch (state) {
                  case AuthLoadingState():
                    return const SizedBox.expand(
                      child: ColoredBox(
                        color: Color(0x99FFFFFF),
                        child: Center(child: TbProgressIndicator(size: 50.0)),
                      ),
                    );
                  case AuthDataState():
                    return Positioned.fill(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(24, 71, 24, 24),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight - (71 + 24),
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          ThingsboardImage.thingsBoardWithTitle,
                                          height: 25,
                                          colorFilter: ColorFilter.mode(
                                            Theme.of(context).primaryColor,
                                            BlendMode.srcIn,
                                          ),
                                          semanticsLabel:
                                              S.of(context).logoDefaultValue,
                                        ),
                                        const SizedBox(height: 25),
                                        Visibility(
                                          visible: selectedRegion != null,
                                          child: TextButton(
                                            onPressed: () {
                                              tbContext.showFullScreenDialog(
                                                ChooseRegionScreen(
                                                  tbContext,
                                                  nASelected:
                                                      selectedRegion ==
                                                      Region.northAmerica,
                                                  europeSelected:
                                                      selectedRegion ==
                                                      Region.europe,
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  selectedRegion
                                                          ?.regionToString(context) ??
                                                      '',
                                                  style: TbTextStyles.bodyLarge,
                                                ),
                                                const SizedBox(width: 6),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 4,
                                                  ),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                    Align(
                                      child: Text(
                                        S.of(context).loginNotification,
                                        style: TbTextStyles.titleLarge.copyWith(
                                          color: Colors.black.withValues(
                                            alpha: .87,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 48),
                                    if (state.oAuthClients.isNotEmpty)
                                      _buildOAuth2Buttons(state.oAuthClients),
                                    Visibility(
                                      visible: state.oAuthClients.isEmpty,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            child: Center(
                                              child: Text(
                                              
                                                S.of(context).loginWith,
                                                style: TbTextStyles.bodyMedium
                                                    .copyWith(
                                                      color: Colors.black
                                                          .withValues(
                                                            alpha: .54,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              OutlinedButton(
                                                style: _oauth2IconButtonStyle,
                                                onPressed:
                                                    () async =>
                                                        await _onLoginWithBarcode(
                                                          context,
                                                        ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      ThingsboardImage
                                                          // translate-me-ignore-next-line
                                                          .oauth2Logos['qr-code-logo']!,
                                                      height: 24,
                                                    ),
                                                    const SizedBox(width: 8),
                                                     Text(
                                                      S.of(context).scanQrCode,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Divider(
                                              color: Colors.black.withValues(
                                                alpha: .12,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Text(
                                              S.of(context).or,
                                              style: TbTextStyles.bodyMedium
                                                  .copyWith(
                                                    color: Colors.black
                                                        .withValues(alpha: .54),
                                                  ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Divider(
                                              color: Colors.black.withValues(
                                                alpha: .12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AutofillGroup(
                                      child: FormBuilder(
                                        key: _loginFormKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            FormBuilderTextField(
                                              autofillHints: const [
                                                AutofillHints.email,
                                              ],
                                              name: 'username',
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator:
                                                  FormBuilderValidators.compose([
                                                    FormBuilderValidators.required(
                                                      errorText:
                                                          S
                                                              .of(context)
                                                              .emailRequireText,
                                                    ),
                                                    FormBuilderValidators.email(
                                                      errorText:
                                                          S
                                                              .of(context)
                                                              .emailInvalidText,
                                                    ),
                                                  ]),
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withValues(
                                                              alpha: .12,
                                                            ),
                                                      ),
                                                    ),
                                                labelText: S.of(context).email,
                                                labelStyle: TbTextStyles
                                                    .bodyLarge
                                                    .copyWith(
                                                      color: Colors.black
                                                          .withValues(
                                                            alpha: .54,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            ValueListenableBuilder(
                                              valueListenable:
                                                  _showPasswordNotifier,
                                              builder: (
                                                BuildContext context,
                                                bool showPassword,
                                                child,
                                              ) {
                                                return FormBuilderTextField(
                                                  autofillHints: const [
                                                    AutofillHints.password,
                                                  ],
                                                  name: 'password',
                                                  obscureText: !showPassword,
                                                  validator: FormBuilderValidators.compose([
                                                    FormBuilderValidators.required(
                                                      errorText:
                                                          S
                                                              .of(context)
                                                              .passwordRequireText,
                                                    ),
                                                  ]),
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        showPassword
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                      ),
                                                      onPressed: () {
                                                        _showPasswordNotifier
                                                                .value =
                                                            !_showPasswordNotifier
                                                                .value;
                                                      },
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withValues(
                                                                      alpha:
                                                                          .12,
                                                                    ),
                                                              ),
                                                        ),
                                                    labelText:
                                                        S.of(context).password,
                                                    labelStyle: TbTextStyles
                                                        .bodyLarge
                                                        .copyWith(
                                                          color: Colors.black
                                                              .withValues(
                                                                alpha: .54,
                                                              ),
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            _forgotPassword();
                                          },
                                          child: Text(
                                            S.of(context).passwordForgotText,
                                            style: TbTextStyles.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        _login();
                                      },
                                      child: Text(
                                        S.of(context).login,
                                        style: TbTextStyles.labelMedium,
                                      ),
                                    ),
                                    const SizedBox(height: 48),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                }
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isLoginNotifier,
              builder: (BuildContext context, bool loading, child) {
                if (loading) {
                  final data = MediaQuery.of(context);
                  var bottomPadding = data.padding.top;
                  bottomPadding += kToolbarHeight;
                  return SizedBox.expand(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withValues(alpha: 0.2),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: bottomPadding),
                            alignment: Alignment.center,
                            child: const TbProgressIndicator(size: 50.0),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onLoginWithBarcode(BuildContext context) async {
    FocusScope.of(context).unfocus();
    try {
      final Barcode? barcode = await getIt<ThingsboardAppRouter>().navigateTo(
        '/qrCodeScan',
        transition: TransitionType.nativeModal,
      );

      if (barcode != null && barcode.rawValue != null) {
        getIt<ThingsboardAppRouter>().navigateByAppLink(barcode.rawValue);
      }
    } catch (e) {
      log.error('Login with qr code error', e);
    }
  }

  Widget _buildOAuth2Buttons(List<OAuth2ClientInfo> clients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
             S.of(context).loginWith,
              style: TbTextStyles.bodyMedium.copyWith(
                color: Colors.black.withValues(alpha: .54),
              ),
            ),
          ),
        ),
        Row(
          children: [
            ...clients
                .asMap()
                .map(
                  (index, client) => MapEntry(
                    index,
                    _buildOAuth2Button(
                      client,
                      true,
                      index == clients.length - 1,
                    ),
                  ),
                )
                .values,
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                style: _oauth2IconButtonStyle,
                onPressed: ()  => _onLoginWithBarcode(context),
                child: SvgPicture.asset(
                  // translate-me-ignore-next-line
                  ThingsboardImage.oauth2Logos['qr-code']!,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOAuth2Button(OAuth2ClientInfo client, bool expand, bool isLast) {
    Widget? icon;
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
        final iconData = MdiIcons.fromString(strIcon);
        if (iconData != null) {
          icon = Icon(
            iconData,
            size: 24,
            color: Theme.of(context).primaryColor,
          );
        }
      }
    }
    icon ??= Icon(Icons.login, size: 24, color: Theme.of(context).primaryColor);
    final button = OutlinedButton(
      style: _oauth2IconButtonStyle,
      onPressed: () => _oauth2ButtonPressed(client),
      child: icon,
    );

    if (expand) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: isLast ? 0 : 8),
          child: button,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
        child: button,
      );
    }
  }

  Future<void> _oauth2ButtonPressed(OAuth2ClientInfo client) async {
    FocusScope.of(context).unfocus();
    _isLoginNotifier.value = true;
    try {
      final result = await getIt<IOAuth2Client>().authenticate(client.url);
      if (result.success) {
        await tbClient.setUserFromJwtToken(
          result.accessToken,
          result.refreshToken,
          true,
        );
      } else {
        _isLoginNotifier.value = false;
        _overlayService.showErrorNotification((_) => result.error!);
      }
    } catch (e) {
      log.error('Auth Error:', e);
      _isLoginNotifier.value = false;
    }
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    if (_loginFormKey.currentState?.saveAndValidate() ?? false) {
      final formValue = _loginFormKey.currentState!.value;
      final String username = formValue['username'].toString();
      final String password = formValue['password'].toString();
      _isLoginNotifier.value = true;
      try {
        await tbClient.login(LoginRequest(username, password));
      } catch (e) {
        _isLoginNotifier.value = false;
        if (e is! ThingsboardError ||
            e.errorCode == ThingsBoardErrorCode.general) {
          await tbContext.onFatalError(e);
        }
      }
    }
  }

  Future<void> _forgotPassword() async {
    getIt<ThingsboardAppRouter>().navigateTo('/login/resetPasswordRequest');
  }
}
