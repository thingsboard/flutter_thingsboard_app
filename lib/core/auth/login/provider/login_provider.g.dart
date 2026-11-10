// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Login)
final loginProvider = LoginProvider._();

final class LoginProvider extends $NotifierProvider<Login, LoginState> {
  LoginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @$internal
  @override
  Login create() => Login();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginState>(value),
    );
  }
}

String _$loginHash() => r'a0b605c61ca10e4c93b8b439956de3369713a2f6';

abstract class _$Login extends $Notifier<LoginState> {
  LoginState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LoginState, LoginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginState, LoginState>,
              LoginState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
