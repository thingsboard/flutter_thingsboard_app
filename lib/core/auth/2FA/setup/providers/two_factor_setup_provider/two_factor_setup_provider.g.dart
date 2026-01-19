// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_setup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generateConfigHash() => r'b4b4c43cc92d5355d07a5d888e84c486ecaba8d1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [generateConfig].
@ProviderFor(generateConfig)
const generateConfigProvider = GenerateConfigFamily();

/// See also [generateConfig].
class GenerateConfigFamily extends Family<AsyncValue<TwoFaAccountConfig>> {
  /// See also [generateConfig].
  const GenerateConfigFamily();

  /// See also [generateConfig].
  GenerateConfigProvider call(TwoFaProviderType type) {
    return GenerateConfigProvider(type);
  }

  @override
  GenerateConfigProvider getProviderOverride(
    covariant GenerateConfigProvider provider,
  ) {
    return call(provider.type);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generateConfigProvider';
}

/// See also [generateConfig].
class GenerateConfigProvider
    extends AutoDisposeFutureProvider<TwoFaAccountConfig> {
  /// See also [generateConfig].
  GenerateConfigProvider(TwoFaProviderType type)
    : this._internal(
        (ref) => generateConfig(ref as GenerateConfigRef, type),
        from: generateConfigProvider,
        name: r'generateConfigProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$generateConfigHash,
        dependencies: GenerateConfigFamily._dependencies,
        allTransitiveDependencies:
            GenerateConfigFamily._allTransitiveDependencies,
        type: type,
      );

  GenerateConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final TwoFaProviderType type;

  @override
  Override overrideWith(
    FutureOr<TwoFaAccountConfig> Function(GenerateConfigRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateConfigProvider._internal(
        (ref) => create(ref as GenerateConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TwoFaAccountConfig> createElement() {
    return _GenerateConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateConfigProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateConfigRef on AutoDisposeFutureProviderRef<TwoFaAccountConfig> {
  /// The parameter `type` of this provider.
  TwoFaProviderType get type;
}

class _GenerateConfigProviderElement
    extends AutoDisposeFutureProviderElement<TwoFaAccountConfig>
    with GenerateConfigRef {
  _GenerateConfigProviderElement(super.provider);

  @override
  TwoFaProviderType get type => (origin as GenerateConfigProvider).type;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
