// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_confirm_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TwoFactorConfirm)
final twoFactorConfirmProvider = TwoFactorConfirmFamily._();

final class TwoFactorConfirmProvider
    extends $NotifierProvider<TwoFactorConfirm, TwoFactorConfirmState> {
  TwoFactorConfirmProvider._({
    required TwoFactorConfirmFamily super.from,
    required (TwoFaProviderType, int?) super.argument,
  }) : super(
         retry: null,
         name: r'twoFactorConfirmProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$twoFactorConfirmHash();

  @override
  String toString() {
    return r'twoFactorConfirmProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TwoFactorConfirm create() => TwoFactorConfirm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TwoFactorConfirmState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TwoFactorConfirmState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TwoFactorConfirmProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$twoFactorConfirmHash() => r'3c506c19a5b29b03d7f9e8a5323100cac01ac5d3';

final class TwoFactorConfirmFamily extends $Family
    with
        $ClassFamilyOverride<
          TwoFactorConfirm,
          TwoFactorConfirmState,
          TwoFactorConfirmState,
          TwoFactorConfirmState,
          (TwoFaProviderType, int?)
        > {
  TwoFactorConfirmFamily._()
    : super(
        retry: null,
        name: r'twoFactorConfirmProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TwoFactorConfirmProvider call(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  ) => TwoFactorConfirmProvider._(
    argument: (type, resendTimerDurationSeconds),
    from: this,
  );

  @override
  String toString() => r'twoFactorConfirmProvider';
}

abstract class _$TwoFactorConfirm extends $Notifier<TwoFactorConfirmState> {
  late final _$args = ref.$arg as (TwoFaProviderType, int?);
  TwoFaProviderType get type => _$args.$1;
  int? get resendTimerDurationSeconds => _$args.$2;

  TwoFactorConfirmState build(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  );
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TwoFactorConfirmState, TwoFactorConfirmState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TwoFactorConfirmState, TwoFactorConfirmState>,
              TwoFactorConfirmState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
