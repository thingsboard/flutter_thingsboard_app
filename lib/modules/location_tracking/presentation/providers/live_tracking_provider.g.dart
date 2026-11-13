// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiveTracking)
final liveTrackingProvider = LiveTrackingProvider._();

final class LiveTrackingProvider
    extends $NotifierProvider<LiveTracking, LiveTrackingViewState> {
  LiveTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveTrackingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveTrackingHash();

  @$internal
  @override
  LiveTracking create() => LiveTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveTrackingViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveTrackingViewState>(value),
    );
  }
}

String _$liveTrackingHash() => r'bd053f24dfe54ab8514d60e1cda51896cea7d15b';

abstract class _$LiveTracking extends $Notifier<LiveTrackingViewState> {
  LiveTrackingViewState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LiveTrackingViewState, LiveTrackingViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiveTrackingViewState, LiveTrackingViewState>,
              LiveTrackingViewState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(targetName)
final targetNameProvider = TargetNameFamily._();

final class TargetNameProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  TargetNameProvider._({
    required TargetNameFamily super.from,
    required ({String entityType, String id}) super.argument,
  }) : super(
         retry: null,
         name: r'targetNameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$targetNameHash();

  @override
  String toString() {
    return r'targetNameProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as ({String entityType, String id});
    return targetName(ref, entityType: argument.entityType, id: argument.id);
  }

  @override
  bool operator ==(Object other) {
    return other is TargetNameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$targetNameHash() => r'645fa4232e9bba656f144a65bb97fc41b9e49ce6';

final class TargetNameFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String?>,
          ({String entityType, String id})
        > {
  TargetNameFamily._()
    : super(
        retry: null,
        name: r'targetNameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TargetNameProvider call({required String entityType, required String id}) =>
      TargetNameProvider._(
        argument: (entityType: entityType, id: id),
        from: this,
      );

  @override
  String toString() => r'targetNameProvider';
}

@ProviderFor(lastRecord)
final lastRecordProvider = LastRecordProvider._();

final class LastRecordProvider
    extends
        $FunctionalProvider<
          AsyncValue<LastTrackingRecord?>,
          LastTrackingRecord?,
          FutureOr<LastTrackingRecord?>
        >
    with
        $FutureModifier<LastTrackingRecord?>,
        $FutureProvider<LastTrackingRecord?> {
  LastRecordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastRecordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastRecordHash();

  @$internal
  @override
  $FutureProviderElement<LastTrackingRecord?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LastTrackingRecord?> create(Ref ref) {
    return lastRecord(ref);
  }
}

String _$lastRecordHash() => r'648394a8af4909026aa63b36d9e48965560bf5da';
