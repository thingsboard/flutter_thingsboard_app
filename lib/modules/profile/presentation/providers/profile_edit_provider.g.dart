// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileEditProvider)
final profileEditProviderProvider = ProfileEditProviderProvider._();

final class ProfileEditProviderProvider
    extends $NotifierProvider<ProfileEditProvider, ProfileEditState> {
  ProfileEditProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileEditProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileEditProviderHash();

  @$internal
  @override
  ProfileEditProvider create() => ProfileEditProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileEditState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileEditState>(value),
    );
  }
}

String _$profileEditProviderHash() =>
    r'602c5ee9569de5d47a8e84fbb51ed65278c09fd5';

abstract class _$ProfileEditProvider extends $Notifier<ProfileEditState> {
  ProfileEditState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileEditState, ProfileEditState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileEditState, ProfileEditState>,
              ProfileEditState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
