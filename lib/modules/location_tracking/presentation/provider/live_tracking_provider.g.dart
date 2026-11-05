// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$targetNameHash() => r'645fa4232e9bba656f144a65bb97fc41b9e49ce6';

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

/// See also [targetName].
@ProviderFor(targetName)
const targetNameProvider = TargetNameFamily();

/// See also [targetName].
class TargetNameFamily extends Family<AsyncValue<String?>> {
  /// See also [targetName].
  const TargetNameFamily();

  /// See also [targetName].
  TargetNameProvider call({required String entityType, required String id}) {
    return TargetNameProvider(entityType: entityType, id: id);
  }

  @override
  TargetNameProvider getProviderOverride(
    covariant TargetNameProvider provider,
  ) {
    return call(entityType: provider.entityType, id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'targetNameProvider';
}

/// See also [targetName].
class TargetNameProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [targetName].
  TargetNameProvider({required String entityType, required String id})
    : this._internal(
        (ref) =>
            targetName(ref as TargetNameRef, entityType: entityType, id: id),
        from: targetNameProvider,
        name: r'targetNameProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$targetNameHash,
        dependencies: TargetNameFamily._dependencies,
        allTransitiveDependencies: TargetNameFamily._allTransitiveDependencies,
        entityType: entityType,
        id: id,
      );

  TargetNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityType,
    required this.id,
  }) : super.internal();

  final String entityType;
  final String id;

  @override
  Override overrideWith(
    FutureOr<String?> Function(TargetNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TargetNameProvider._internal(
        (ref) => create(ref as TargetNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityType: entityType,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _TargetNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TargetNameProvider &&
        other.entityType == entityType &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TargetNameRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `entityType` of this provider.
  String get entityType;

  /// The parameter `id` of this provider.
  String get id;
}

class _TargetNameProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with TargetNameRef {
  _TargetNameProviderElement(super.provider);

  @override
  String get entityType => (origin as TargetNameProvider).entityType;
  @override
  String get id => (origin as TargetNameProvider).id;
}

String _$lastRecordHash() => r'648394a8af4909026aa63b36d9e48965560bf5da';

/// See also [lastRecord].
@ProviderFor(lastRecord)
final lastRecordProvider =
    AutoDisposeFutureProvider<LastTrackingRecord?>.internal(
      lastRecord,
      name: r'lastRecordProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$lastRecordHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastRecordRef = AutoDisposeFutureProviderRef<LastTrackingRecord?>;
String _$liveTrackingHash() => r'bd053f24dfe54ab8514d60e1cda51896cea7d15b';

/// See also [LiveTracking].
@ProviderFor(LiveTracking)
final liveTrackingProvider =
    AutoDisposeNotifierProvider<LiveTracking, LiveTrackingViewState>.internal(
      LiveTracking.new,
      name: r'liveTrackingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$liveTrackingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LiveTracking = AutoDisposeNotifier<LiveTrackingViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
