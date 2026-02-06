// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_confirm_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$twoFactorConfirmHash() => r'282bb3abf59cb4ef6e1dd53add24b4435dc6273b';

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

abstract class _$TwoFactorConfirm
    extends BuildlessAutoDisposeNotifier<TwoFactorConfirmState> {
  late final TwoFaProviderType type;
  late final int? resendTimerDurationSeconds;

  TwoFactorConfirmState build(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  );
}

/// See also [TwoFactorConfirm].
@ProviderFor(TwoFactorConfirm)
const twoFactorConfirmProvider = TwoFactorConfirmFamily();

/// See also [TwoFactorConfirm].
class TwoFactorConfirmFamily extends Family<TwoFactorConfirmState> {
  /// See also [TwoFactorConfirm].
  const TwoFactorConfirmFamily();

  /// See also [TwoFactorConfirm].
  TwoFactorConfirmProvider call(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  ) {
    return TwoFactorConfirmProvider(type, resendTimerDurationSeconds);
  }

  @override
  TwoFactorConfirmProvider getProviderOverride(
    covariant TwoFactorConfirmProvider provider,
  ) {
    return call(provider.type, provider.resendTimerDurationSeconds);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'twoFactorConfirmProvider';
}

/// See also [TwoFactorConfirm].
class TwoFactorConfirmProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TwoFactorConfirm,
          TwoFactorConfirmState
        > {
  /// See also [TwoFactorConfirm].
  TwoFactorConfirmProvider(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  ) : this._internal(
        () =>
            TwoFactorConfirm()
              ..type = type
              ..resendTimerDurationSeconds = resendTimerDurationSeconds,
        from: twoFactorConfirmProvider,
        name: r'twoFactorConfirmProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$twoFactorConfirmHash,
        dependencies: TwoFactorConfirmFamily._dependencies,
        allTransitiveDependencies:
            TwoFactorConfirmFamily._allTransitiveDependencies,
        type: type,
        resendTimerDurationSeconds: resendTimerDurationSeconds,
      );

  TwoFactorConfirmProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.resendTimerDurationSeconds,
  }) : super.internal();

  final TwoFaProviderType type;
  final int? resendTimerDurationSeconds;

  @override
  TwoFactorConfirmState runNotifierBuild(covariant TwoFactorConfirm notifier) {
    return notifier.build(type, resendTimerDurationSeconds);
  }

  @override
  Override overrideWith(TwoFactorConfirm Function() create) {
    return ProviderOverride(
      origin: this,
      override: TwoFactorConfirmProvider._internal(
        () =>
            create()
              ..type = type
              ..resendTimerDurationSeconds = resendTimerDurationSeconds,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        resendTimerDurationSeconds: resendTimerDurationSeconds,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TwoFactorConfirm, TwoFactorConfirmState>
  createElement() {
    return _TwoFactorConfirmProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TwoFactorConfirmProvider &&
        other.type == type &&
        other.resendTimerDurationSeconds == resendTimerDurationSeconds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, resendTimerDurationSeconds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TwoFactorConfirmRef
    on AutoDisposeNotifierProviderRef<TwoFactorConfirmState> {
  /// The parameter `type` of this provider.
  TwoFaProviderType get type;

  /// The parameter `resendTimerDurationSeconds` of this provider.
  int? get resendTimerDurationSeconds;
}

class _TwoFactorConfirmProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TwoFactorConfirm,
          TwoFactorConfirmState
        >
    with TwoFactorConfirmRef {
  _TwoFactorConfirmProviderElement(super.provider);

  @override
  TwoFaProviderType get type => (origin as TwoFactorConfirmProvider).type;
  @override
  int? get resendTimerDurationSeconds =>
      (origin as TwoFactorConfirmProvider).resendTimerDurationSeconds;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
