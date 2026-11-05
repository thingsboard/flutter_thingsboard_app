// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wl_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Wl)
final wlProvider = WlProvider._();

final class WlProvider extends $NotifierProvider<Wl, WlState> {
  WlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wlHash();

  @$internal
  @override
  Wl create() => Wl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WlState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WlState>(value),
    );
  }
}

String _$wlHash() => r'37368b9928cfd8f594a2cf9ad890820aa01694c9';

abstract class _$Wl extends $Notifier<WlState> {
  WlState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<WlState, WlState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WlState, WlState>,
              WlState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
