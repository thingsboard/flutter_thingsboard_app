// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Error)
final errorProvider = ErrorProvider._();

final class ErrorProvider extends $NotifierProvider<Error, void> {
  ErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorHash();

  @$internal
  @override
  Error create() => Error();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$errorHash() => r'15539c7a40cb722fed920ac40f8e3483249cfc13';

abstract class _$Error extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
