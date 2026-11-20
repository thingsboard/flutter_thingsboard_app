// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_setup_avalible_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(twoFactorSetupAvalibleProviders)
final twoFactorSetupAvalibleProvidersProvider =
    TwoFactorSetupAvalibleProvidersProvider._();

final class TwoFactorSetupAvalibleProvidersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TwoFaProviderType>>,
          List<TwoFaProviderType>,
          FutureOr<List<TwoFaProviderType>>
        >
    with
        $FutureModifier<List<TwoFaProviderType>>,
        $FutureProvider<List<TwoFaProviderType>> {
  TwoFactorSetupAvalibleProvidersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'twoFactorSetupAvalibleProvidersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$twoFactorSetupAvalibleProvidersHash();

  @$internal
  @override
  $FutureProviderElement<List<TwoFaProviderType>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TwoFaProviderType>> create(Ref ref) {
    return twoFactorSetupAvalibleProviders(ref);
  }
}

String _$twoFactorSetupAvalibleProvidersHash() =>
    r'a9fdf60b6fdaa889d68372611ebae6423058c05b';
