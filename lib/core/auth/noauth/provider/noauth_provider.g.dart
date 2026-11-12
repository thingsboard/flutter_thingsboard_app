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

String _$noauthProviderHash() => r'c29b1f38124cc86eaf1b933190de00f7d9de939c';

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
