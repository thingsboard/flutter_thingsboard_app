// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_setup_account_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(acountTwoFactorSettings)
final acountTwoFactorSettingsProvider = AcountTwoFactorSettingsProvider._();

final class AcountTwoFactorSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AccountTwoFaSettings?>,
          AccountTwoFaSettings?,
          FutureOr<AccountTwoFaSettings?>
        >
    with
        $FutureModifier<AccountTwoFaSettings?>,
        $FutureProvider<AccountTwoFaSettings?> {
  AcountTwoFactorSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'acountTwoFactorSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$acountTwoFactorSettingsHash();

  @$internal
  @override
  $FutureProviderElement<AccountTwoFaSettings?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AccountTwoFaSettings?> create(Ref ref) {
    return acountTwoFactorSettings(ref);
  }
}

String _$acountTwoFactorSettingsHash() =>
    r'4e1f0b3381db08a50cf7c3f1506907c8618beefb';
