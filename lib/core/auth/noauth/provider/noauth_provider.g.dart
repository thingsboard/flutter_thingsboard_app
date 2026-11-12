// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noauth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoauthProvider)
final noauthProviderProvider = NoauthProviderProvider._();

final class NoauthProviderProvider
    extends $NotifierProvider<NoauthProvider, NoAuthState> {
  NoauthProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noauthProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noauthProviderHash();

  @$internal
  @override
  NoauthProvider create() => NoauthProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoAuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoAuthState>(value),
    );
  }
}

String _$noauthProviderHash() => r'24fad3af4a048b8e58c78de0e62ff33c32cc7a38';

abstract class _$NoauthProvider extends $Notifier<NoAuthState> {
  NoAuthState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NoAuthState, NoAuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NoAuthState, NoAuthState>,
              NoAuthState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
