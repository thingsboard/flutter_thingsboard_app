// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(oauth)
final oauthProvider = OauthProvider._();

final class OauthProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginMobileInfo>,
          LoginMobileInfo,
          FutureOr<LoginMobileInfo>
        >
    with $FutureModifier<LoginMobileInfo>, $FutureProvider<LoginMobileInfo> {
  OauthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oauthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oauthHash();

  @$internal
  @override
  $FutureProviderElement<LoginMobileInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginMobileInfo> create(Ref ref) {
    return oauth(ref);
  }
}

String _$oauthHash() => r'38a771cc5d6b0994aea3f2af7236da7399b7eccf';
