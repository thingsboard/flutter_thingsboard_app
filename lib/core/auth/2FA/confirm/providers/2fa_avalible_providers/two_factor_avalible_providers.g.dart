// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_avalible_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(twoFaConfirmAvalibleProviders)
final twoFaConfirmAvalibleProvidersProvider =
    TwoFaConfirmAvalibleProvidersProvider._();

final class TwoFaConfirmAvalibleProvidersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TwoFaProviderInfo>>,
          List<TwoFaProviderInfo>,
          FutureOr<List<TwoFaProviderInfo>>
        >
    with
        $FutureModifier<List<TwoFaProviderInfo>>,
        $FutureProvider<List<TwoFaProviderInfo>> {
  TwoFaConfirmAvalibleProvidersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'twoFaConfirmAvalibleProvidersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$twoFaConfirmAvalibleProvidersHash();

  @$internal
  @override
  $FutureProviderElement<List<TwoFaProviderInfo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TwoFaProviderInfo>> create(Ref ref) {
    return twoFaConfirmAvalibleProviders(ref);
  }
}

String _$twoFaConfirmAvalibleProvidersHash() =>
    r'33b28c823f302339070d33d5cd1b06185afdadb1';
