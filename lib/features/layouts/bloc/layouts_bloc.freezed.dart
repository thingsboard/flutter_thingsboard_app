// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layouts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LayoutsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetch,
    required TResult Function(Orientation orientation, Size screenSize)
        orientationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetch,
    TResult? Function(Orientation orientation, Size screenSize)?
        orientationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetch,
    TResult Function(Orientation orientation, Size screenSize)?
        orientationChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarFetchEvent value) fetch,
    required TResult Function(BottomBarOrientationChangedEvent value)
        orientationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarFetchEvent value)? fetch,
    TResult? Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarFetchEvent value)? fetch,
    TResult Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutsEventCopyWith<$Res> {
  factory $LayoutsEventCopyWith(
          LayoutsEvent value, $Res Function(LayoutsEvent) then) =
      _$LayoutsEventCopyWithImpl<$Res, LayoutsEvent>;
}

/// @nodoc
class _$LayoutsEventCopyWithImpl<$Res, $Val extends LayoutsEvent>
    implements $LayoutsEventCopyWith<$Res> {
  _$LayoutsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BottomBarFetchEventImplCopyWith<$Res> {
  factory _$$BottomBarFetchEventImplCopyWith(_$BottomBarFetchEventImpl value,
          $Res Function(_$BottomBarFetchEventImpl) then) =
      __$$BottomBarFetchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$BottomBarFetchEventImplCopyWithImpl<$Res>
    extends _$LayoutsEventCopyWithImpl<$Res, _$BottomBarFetchEventImpl>
    implements _$$BottomBarFetchEventImplCopyWith<$Res> {
  __$$BottomBarFetchEventImplCopyWithImpl(_$BottomBarFetchEventImpl _value,
      $Res Function(_$BottomBarFetchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$BottomBarFetchEventImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$BottomBarFetchEventImpl implements BottomBarFetchEvent {
  const _$BottomBarFetchEventImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LayoutsEvent.fetch(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarFetchEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarFetchEventImplCopyWith<_$BottomBarFetchEventImpl> get copyWith =>
      __$$BottomBarFetchEventImplCopyWithImpl<_$BottomBarFetchEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetch,
    required TResult Function(Orientation orientation, Size screenSize)
        orientationChanged,
  }) {
    return fetch(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetch,
    TResult? Function(Orientation orientation, Size screenSize)?
        orientationChanged,
  }) {
    return fetch?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetch,
    TResult Function(Orientation orientation, Size screenSize)?
        orientationChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarFetchEvent value) fetch,
    required TResult Function(BottomBarOrientationChangedEvent value)
        orientationChanged,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarFetchEvent value)? fetch,
    TResult? Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarFetchEvent value)? fetch,
    TResult Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class BottomBarFetchEvent implements LayoutsEvent {
  const factory BottomBarFetchEvent(final BuildContext context) =
      _$BottomBarFetchEventImpl;

  BuildContext get context;

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomBarFetchEventImplCopyWith<_$BottomBarFetchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BottomBarOrientationChangedEventImplCopyWith<$Res> {
  factory _$$BottomBarOrientationChangedEventImplCopyWith(
          _$BottomBarOrientationChangedEventImpl value,
          $Res Function(_$BottomBarOrientationChangedEventImpl) then) =
      __$$BottomBarOrientationChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Orientation orientation, Size screenSize});
}

/// @nodoc
class __$$BottomBarOrientationChangedEventImplCopyWithImpl<$Res>
    extends _$LayoutsEventCopyWithImpl<$Res,
        _$BottomBarOrientationChangedEventImpl>
    implements _$$BottomBarOrientationChangedEventImplCopyWith<$Res> {
  __$$BottomBarOrientationChangedEventImplCopyWithImpl(
      _$BottomBarOrientationChangedEventImpl _value,
      $Res Function(_$BottomBarOrientationChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orientation = null,
    Object? screenSize = null,
  }) {
    return _then(_$BottomBarOrientationChangedEventImpl(
      null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      null == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$BottomBarOrientationChangedEventImpl
    implements BottomBarOrientationChangedEvent {
  const _$BottomBarOrientationChangedEventImpl(
      this.orientation, this.screenSize);

  @override
  final Orientation orientation;
  @override
  final Size screenSize;

  @override
  String toString() {
    return 'LayoutsEvent.orientationChanged(orientation: $orientation, screenSize: $screenSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarOrientationChangedEventImpl &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orientation, screenSize);

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarOrientationChangedEventImplCopyWith<
          _$BottomBarOrientationChangedEventImpl>
      get copyWith => __$$BottomBarOrientationChangedEventImplCopyWithImpl<
          _$BottomBarOrientationChangedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetch,
    required TResult Function(Orientation orientation, Size screenSize)
        orientationChanged,
  }) {
    return orientationChanged(orientation, screenSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetch,
    TResult? Function(Orientation orientation, Size screenSize)?
        orientationChanged,
  }) {
    return orientationChanged?.call(orientation, screenSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetch,
    TResult Function(Orientation orientation, Size screenSize)?
        orientationChanged,
    required TResult orElse(),
  }) {
    if (orientationChanged != null) {
      return orientationChanged(orientation, screenSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarFetchEvent value) fetch,
    required TResult Function(BottomBarOrientationChangedEvent value)
        orientationChanged,
  }) {
    return orientationChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarFetchEvent value)? fetch,
    TResult? Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
  }) {
    return orientationChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarFetchEvent value)? fetch,
    TResult Function(BottomBarOrientationChangedEvent value)?
        orientationChanged,
    required TResult orElse(),
  }) {
    if (orientationChanged != null) {
      return orientationChanged(this);
    }
    return orElse();
  }
}

abstract class BottomBarOrientationChangedEvent implements LayoutsEvent {
  const factory BottomBarOrientationChangedEvent(
          final Orientation orientation, final Size screenSize) =
      _$BottomBarOrientationChangedEventImpl;

  Orientation get orientation;
  Size get screenSize;

  /// Create a copy of LayoutsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomBarOrientationChangedEventImplCopyWith<
          _$BottomBarOrientationChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LayoutsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TbMainNavigationItem> items) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TbMainNavigationItem> items)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TbMainNavigationItem> items)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarLoadingState value) loading,
    required TResult Function(BottomBarDataState value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarLoadingState value)? loading,
    TResult? Function(BottomBarDataState value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarLoadingState value)? loading,
    TResult Function(BottomBarDataState value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutsStateCopyWith<$Res> {
  factory $LayoutsStateCopyWith(
          LayoutsState value, $Res Function(LayoutsState) then) =
      _$LayoutsStateCopyWithImpl<$Res, LayoutsState>;
}

/// @nodoc
class _$LayoutsStateCopyWithImpl<$Res, $Val extends LayoutsState>
    implements $LayoutsStateCopyWith<$Res> {
  _$LayoutsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LayoutsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BottomBarLoadingStateImplCopyWith<$Res> {
  factory _$$BottomBarLoadingStateImplCopyWith(
          _$BottomBarLoadingStateImpl value,
          $Res Function(_$BottomBarLoadingStateImpl) then) =
      __$$BottomBarLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BottomBarLoadingStateImplCopyWithImpl<$Res>
    extends _$LayoutsStateCopyWithImpl<$Res, _$BottomBarLoadingStateImpl>
    implements _$$BottomBarLoadingStateImplCopyWith<$Res> {
  __$$BottomBarLoadingStateImplCopyWithImpl(_$BottomBarLoadingStateImpl _value,
      $Res Function(_$BottomBarLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LayoutsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BottomBarLoadingStateImpl implements BottomBarLoadingState {
  const _$BottomBarLoadingStateImpl();

  @override
  String toString() {
    return 'LayoutsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TbMainNavigationItem> items) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TbMainNavigationItem> items)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TbMainNavigationItem> items)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarLoadingState value) loading,
    required TResult Function(BottomBarDataState value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarLoadingState value)? loading,
    TResult? Function(BottomBarDataState value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarLoadingState value)? loading,
    TResult Function(BottomBarDataState value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BottomBarLoadingState implements LayoutsState {
  const factory BottomBarLoadingState() = _$BottomBarLoadingStateImpl;
}

/// @nodoc
abstract class _$$BottomBarDataStateImplCopyWith<$Res> {
  factory _$$BottomBarDataStateImplCopyWith(_$BottomBarDataStateImpl value,
          $Res Function(_$BottomBarDataStateImpl) then) =
      __$$BottomBarDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TbMainNavigationItem> items});
}

/// @nodoc
class __$$BottomBarDataStateImplCopyWithImpl<$Res>
    extends _$LayoutsStateCopyWithImpl<$Res, _$BottomBarDataStateImpl>
    implements _$$BottomBarDataStateImplCopyWith<$Res> {
  __$$BottomBarDataStateImplCopyWithImpl(_$BottomBarDataStateImpl _value,
      $Res Function(_$BottomBarDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LayoutsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BottomBarDataStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TbMainNavigationItem>,
    ));
  }
}

/// @nodoc

class _$BottomBarDataStateImpl implements BottomBarDataState {
  const _$BottomBarDataStateImpl(
      {required final List<TbMainNavigationItem> items})
      : _items = items;

  final List<TbMainNavigationItem> _items;
  @override
  List<TbMainNavigationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LayoutsState.data(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarDataStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of LayoutsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarDataStateImplCopyWith<_$BottomBarDataStateImpl> get copyWith =>
      __$$BottomBarDataStateImplCopyWithImpl<_$BottomBarDataStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TbMainNavigationItem> items) data,
  }) {
    return data(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TbMainNavigationItem> items)? data,
  }) {
    return data?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TbMainNavigationItem> items)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomBarLoadingState value) loading,
    required TResult Function(BottomBarDataState value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomBarLoadingState value)? loading,
    TResult? Function(BottomBarDataState value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomBarLoadingState value)? loading,
    TResult Function(BottomBarDataState value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class BottomBarDataState implements LayoutsState {
  const factory BottomBarDataState(
          {required final List<TbMainNavigationItem> items}) =
      _$BottomBarDataStateImpl;

  List<TbMainNavigationItem> get items;

  /// Create a copy of LayoutsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomBarDataStateImplCopyWith<_$BottomBarDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
