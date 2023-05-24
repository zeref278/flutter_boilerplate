// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UIStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStatusCopyWith<$Res> {
  factory $UIStatusCopyWith(UIStatus value, $Res Function(UIStatus) then) =
      _$UIStatusCopyWithImpl<$Res, UIStatus>;
}

/// @nodoc
class _$UIStatusCopyWithImpl<$Res, $Val extends UIStatus>
    implements $UIStatusCopyWith<$Res> {
  _$UIStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UIInitialCopyWith<$Res> {
  factory _$$UIInitialCopyWith(
          _$UIInitial value, $Res Function(_$UIInitial) then) =
      __$$UIInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UIInitialCopyWithImpl<$Res>
    extends _$UIStatusCopyWithImpl<$Res, _$UIInitial>
    implements _$$UIInitialCopyWith<$Res> {
  __$$UIInitialCopyWithImpl(
      _$UIInitial _value, $Res Function(_$UIInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UIInitial implements UIInitial {
  const _$UIInitial();

  @override
  String toString() {
    return 'UIStatus.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UIInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UIInitial implements UIStatus {
  const factory UIInitial() = _$UIInitial;
}

/// @nodoc
abstract class _$$UILoadingCopyWith<$Res> {
  factory _$$UILoadingCopyWith(
          _$UILoading value, $Res Function(_$UILoading) then) =
      __$$UILoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UILoadingCopyWithImpl<$Res>
    extends _$UIStatusCopyWithImpl<$Res, _$UILoading>
    implements _$$UILoadingCopyWith<$Res> {
  __$$UILoadingCopyWithImpl(
      _$UILoading _value, $Res Function(_$UILoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UILoading implements UILoading {
  const _$UILoading();

  @override
  String toString() {
    return 'UIStatus.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UILoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
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
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UILoading implements UIStatus {
  const factory UILoading() = _$UILoading;
}

/// @nodoc
abstract class _$$UILoadFailedCopyWith<$Res> {
  factory _$$UILoadFailedCopyWith(
          _$UILoadFailed value, $Res Function(_$UILoadFailed) then) =
      __$$UILoadFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UILoadFailedCopyWithImpl<$Res>
    extends _$UIStatusCopyWithImpl<$Res, _$UILoadFailed>
    implements _$$UILoadFailedCopyWith<$Res> {
  __$$UILoadFailedCopyWithImpl(
      _$UILoadFailed _value, $Res Function(_$UILoadFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UILoadFailed(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UILoadFailed implements UILoadFailed {
  const _$UILoadFailed({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'UIStatus.loadFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UILoadFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UILoadFailedCopyWith<_$UILoadFailed> get copyWith =>
      __$$UILoadFailedCopyWithImpl<_$UILoadFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class UILoadFailed implements UIStatus {
  const factory UILoadFailed({required final String message}) = _$UILoadFailed;

  String get message;
  @JsonKey(ignore: true)
  _$$UILoadFailedCopyWith<_$UILoadFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UILoadSuccessCopyWith<$Res> {
  factory _$$UILoadSuccessCopyWith(
          _$UILoadSuccess value, $Res Function(_$UILoadSuccess) then) =
      __$$UILoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UILoadSuccessCopyWithImpl<$Res>
    extends _$UIStatusCopyWithImpl<$Res, _$UILoadSuccess>
    implements _$$UILoadSuccessCopyWith<$Res> {
  __$$UILoadSuccessCopyWithImpl(
      _$UILoadSuccess _value, $Res Function(_$UILoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UILoadSuccess(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UILoadSuccess implements UILoadSuccess {
  const _$UILoadSuccess({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'UIStatus.loadSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UILoadSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UILoadSuccessCopyWith<_$UILoadSuccess> get copyWith =>
      __$$UILoadSuccessCopyWithImpl<_$UILoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) {
    return loadSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) {
    return loadSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class UILoadSuccess implements UIStatus {
  const factory UILoadSuccess({final String? message}) = _$UILoadSuccess;

  String? get message;
  @JsonKey(ignore: true)
  _$$UILoadSuccessCopyWith<_$UILoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
