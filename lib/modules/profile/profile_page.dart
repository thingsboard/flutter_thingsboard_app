import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/profile/change_password_page.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tost_notifications_extension.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ProfilePage extends TbPageWidget {
  ProfilePage(
    TbContext tbContext, {
    bool fullscreen = false,
    super.key,
  })  : _fullscreen = fullscreen,
        super(tbContext);
  final bool _fullscreen;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends TbPageState<ProfilePage> {
  final _isLoadingNotifier = ValueNotifier<bool>(true);

  final _profileFormKey = GlobalKey<FormBuilderState>();

  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              _saveProfile();
            },
          ),
          if (widget._fullscreen)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                tbContext.logout();
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _profileFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'email',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: S.of(context).emailRequireText,
                          ),
                          FormBuilderValidators.email(
                            errorText: S.of(context).emailInvalidText,
                          ),
                        ]),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: S.of(context).emailStar,
                        ),
                      ),
                      const SizedBox(height: 24),
                      FormBuilderTextField(
                        name: 'firstName',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: S.of(context).firstNameUpper,
                        ),
                      ),
                      const SizedBox(height: 24),
                      FormBuilderTextField(
                        name: 'lastName',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: S.of(context).lastNameUpper,
                        ),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {
                          _changePassword();
                        },
                        child: Center(
                          child: Text(S.of(context).changePassword),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isLoadingNotifier,
            builder: (BuildContext context, bool loading, child) {
              if (loading) {
                return SizedBox.expand(
                  child: Container(
                    color: const Color(0x99FFFFFF),
                    child: const Center(child: TbProgressIndicator(size: 50.0)),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _loadUser() async {
    _isLoadingNotifier.value = true;
    _currentUser = await tbClient.getUserService().getUser();
    _setUser();
    _isLoadingNotifier.value = false;
  }

  _setUser() {
    _profileFormKey.currentState?.patchValue({
      'email': _currentUser!.email,
      'firstName': _currentUser!.firstName ?? '',
      'lastName': _currentUser!.lastName ?? '',
    });
  }

  Future<void> _saveProfile() async {
    if (_currentUser != null) {
      FocusScope.of(context).unfocus();
      if (_profileFormKey.currentState?.saveAndValidate() ?? false) {
        final formValue = _profileFormKey.currentState!.value;
        _currentUser!.email = formValue['email'];
        _currentUser!.firstName = formValue['firstName'];
        _currentUser!.lastName = formValue['lastName'];
        _isLoadingNotifier.value = true;
        try {
          _currentUser =
              await tbClient.getUserService().saveUser(_currentUser!);
          getIt<IUserService>().setUser(
            _currentUser!,
            authUser: tbClient.getAuthUser()!,
          );
          _setUser();
          await Future.delayed(const Duration(milliseconds: 300));
          _isLoadingNotifier.value = false;
          if (mounted) {
            context.showSuccessNotification(
              S.of(context).profileSuccessNotification,
              duration: const Duration(milliseconds: 1500),
            );

            context.showSuccessNotification(
              S.of(context).profileSuccessNotification,
              duration: const Duration(milliseconds: 1500),
            );
          }
        } catch (_) {
          _isLoadingNotifier.value = false;
        }
      }
    }
  }

  _changePassword() async {
    var res = await tbContext
        .showFullScreenDialog<bool>(ChangePasswordPage(tbContext));
    if (res == true && mounted) {
      context.showSuccessNotification(
        S.of(context).passwordSuccessNotification,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }
}
