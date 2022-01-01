import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/profile/change_password_page.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class ProfilePage extends TbPageWidget {
  final bool _fullscreen;

  ProfilePage(TbContext tbContext, {bool fullscreen = false})
      : _fullscreen = fullscreen,
        super(tbContext);

  @override
  _ProfilePageState createState() => _ProfilePageState();
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TbAppBar(
          tbContext,
          title: const Text('Profile'),
          actions: [
            IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  _saveProfile();
                }),
            if (widget._fullscreen)
              IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    tbClient.logout();
                  })
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
                              FormBuilderValidators.required(context,
                                  errorText: 'Email is required.'),
                              FormBuilderValidators.email(context,
                                  errorText: 'Invalid email format.')
                            ]),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email *'),
                          ),
                          const SizedBox(height: 24),
                          FormBuilderTextField(
                            name: 'firstName',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name'),
                          ),
                          const SizedBox(height: 24),
                          FormBuilderTextField(
                            name: 'lastName',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name'),
                          ),
                          const SizedBox(height: 24),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                _changePassword();
                              },
                              child:
                                  const Center(child: Text('Change Password')))
                        ]),
                  ))),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _isLoadingNotifier,
                builder: (BuildContext context, bool loading, child) {
                  if (loading) {
                    return SizedBox.expand(
                        child: Container(
                      color: const Color(0x99FFFFFF),
                      child:
                          const Center(child: TbProgressIndicator(size: 50.0)),
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                })
          ],
        ));
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
      'lastName': _currentUser!.lastName ?? ''
    });
  }

  Future<void> _saveProfile() async {
    if (_currentUser != null) {
      FocusScope.of(context).unfocus();
      if (_profileFormKey.currentState?.saveAndValidate() ?? false) {
        var formValue = _profileFormKey.currentState!.value;
        _currentUser!.email = formValue['email'];
        _currentUser!.firstName = formValue['firstName'];
        _currentUser!.lastName = formValue['lastName'];
        _isLoadingNotifier.value = true;
        _currentUser = await tbClient.getUserService().saveUser(_currentUser!);
        tbContext.userDetails = _currentUser;
        _setUser();
        await Future.delayed(const Duration(milliseconds: 300));
        _isLoadingNotifier.value = false;
        showSuccessNotification('Profile successfully updated',
            duration: const Duration(milliseconds: 1500));
      }
    }
  }

  _changePassword() async {
    var res = await tbContext
        .showFullScreenDialog<bool>(ChangePasswordPage(tbContext));
    if (res == true) {
      showSuccessNotification('Password successfully changed',
          duration: const Duration(milliseconds: 1500));
    }
  }
}
