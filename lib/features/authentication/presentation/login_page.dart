import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/features/authentication/entities/region.dart';
import 'package:thingsboard_app/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:thingsboard_app/features/authentication/presentation/choose_region_screen.dart';
import 'package:thingsboard_app/features/authentication/presentation/widgets/login_page_background.dart';
import 'package:thingsboard_app/features/authentication/presentation/widgets/oauth2_clients_widget.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart'
    show VersionRoutes;
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart'
    show VersionRouteArguments;
import 'package:thingsboard_app/utils/ui/build_context_extension.dart';
import 'package:thingsboard_app/utils/ui/tb_loading_screen.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormBuilderState>();
  Region? selectedRegion;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc.create()..add(const LoginFetchEvent()),
      child: Scaffold(
        body: Stack(
          children: [
            const LoginPageBackground(),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginStateRequireClientUpdate) {
                  context.navigateTo(
                    VersionRoutes.updateRequiredRoutePath,
                    clearStack: true,
                    replace: true,
                    routeSettings: RouteSettings(
                      arguments: VersionRouteArguments(
                        versionInfo: state.versionInfo,
                        storeInfo: state.storeInfo,
                      ),
                    ),
                  );
                } else if (state is LoginStateMfa) {
                  context.navigateTo('/login/mfa');
                }
              },
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const TbLoadingScreen(),
                  loading: (_) => const TbLoadingScreen(),
                  data: (state) {
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
                                              context.showFullScreenDialog(
                                                ChooseRegionScreen(
                                                  nASelected: selectedRegion ==
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
                                                          ?.regionToString() ??
                                                      '',
                                                  style: TbTextStyles.bodyLarge,
                                                ),
                                                const SizedBox(width: 6),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4),
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
                                          color: Colors.black.withOpacity(.87),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 48),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          child: Center(
                                            child: Text(
                                              S.of(context).loginWith,
                                              style: TbTextStyles.bodyMedium
                                                  .copyWith(
                                                color: Colors.black
                                                    .withValues(alpha: .54),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Oauth2ClientsWidget(
                                          state.oAuthClients,
                                          onPressed: (client) => context
                                              .read<LoginBloc>()
                                              .add(
                                                LoginWithOauth2Event(client),
                                              ),
                                        ),
                                      ],
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
                                              color: Colors.black
                                                  .withValues(alpha: .12),
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
                                              color: Colors.black
                                                  .withValues(alpha: .12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FormBuilder(
                                      key: _loginFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          FormBuilderTextField(
                                            name: 'username',
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator:
                                                FormBuilderValidators.compose(
                                              [
                                                FormBuilderValidators.required(
                                                  errorText: S
                                                      .of(context)
                                                      .emailRequireText,
                                                ),
                                                FormBuilderValidators.email(
                                                  errorText: S
                                                      .of(context)
                                                      .emailInvalidText,
                                                ),
                                              ],
                                            ),
                                            decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black
                                                      .withValues(alpha: .12),
                                                ),
                                              ),
                                              labelText: S.of(context).email,
                                              labelStyle: TbTextStyles.bodyLarge
                                                  .copyWith(
                                                color: Colors.black
                                                    .withValues(alpha: .54),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          FormBuilderTextField(
                                            name: 'password',
                                            obscureText: !_showPassword,
                                            validator:
                                                FormBuilderValidators.compose(
                                              [
                                                FormBuilderValidators.required(
                                                  errorText: S
                                                      .of(context)
                                                      .passwordRequireText,
                                                ),
                                              ],
                                            ),
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _showPassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _showPassword =
                                                        !_showPassword;
                                                  });
                                                },
                                              ),
                                              border:
                                                  const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black
                                                      .withValues(alpha: .12),
                                                ),
                                              ),
                                              labelText: S.of(context).password,
                                              labelStyle: TbTextStyles.bodyLarge
                                                  .copyWith(
                                                color: Colors.black
                                                    .withValues(alpha: .54),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () => context.navigateTo(
                                            '/login/resetPasswordRequest',
                                          ),
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
                                        FocusScope.of(context).unfocus();
                                        if (_loginFormKey.currentState
                                                ?.saveAndValidate() ??
                                            false) {
                                          var formValue =
                                              _loginFormKey.currentState!.value;
                                          final username =
                                              formValue['username'];
                                          final password =
                                              formValue['password'];
                                          context.read<LoginBloc>().add(
                                                Login(
                                                  username: username,
                                                  password: password,
                                                ),
                                              );
                                        }
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
                  },
                  loginWip: (_) => SizedBox.expand(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withValues(alpha: 0.2),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).padding.top,
                            ),
                            alignment: Alignment.center,
                            child: const TbProgressIndicator(size: 50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
