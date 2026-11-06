// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_setup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(generateConfig)
final generateConfigProvider = GenerateConfigFamily._();

final class GenerateConfigProvider
    extends
        $FunctionalProvider<
          AsyncValue<TwoFaAccountConfig>,
          TwoFaAccountConfig,
          FutureOr<TwoFaAccountConfig>
        >
    with
        $FutureModifier<TwoFaAccountConfig>,
        $FutureProvider<TwoFaAccountConfig> {
  GenerateConfigProvider._({
    required GenerateConfigFamily super.from,
    required TwoFaProviderType super.argument,
  }) : super(
         retry: null,
         name: r'generateConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$generateConfigHash();

  @override
  String toString() {
    return r'generateConfigProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TwoFaAccountConfig> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TwoFaAccountConfig> create(Ref ref) {
    final argument = this.argument as TwoFaProviderType;
    return generateConfig(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateConfigProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$generateConfigHash() => r'421ef736fa840869c566e9ea0655906656c34649';

final class GenerateConfigFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<TwoFaAccountConfig>,
          TwoFaProviderType
        > {
  GenerateConfigFamily._()
    : super(
        retry: null,
        name: r'generateConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GenerateConfigProvider call(TwoFaProviderType type) =>
      GenerateConfigProvider._(argument: type, from: this);

  @override
  String toString() => r'generateConfigProvider';
}
