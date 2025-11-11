// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UIStatus {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UIStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UIStatus()';
  }
}

/// @nodoc
class $UIStatusCopyWith<$Res> {
  $UIStatusCopyWith(UIStatus _, $Res Function(UIStatus) __);
}

/// Adds pattern-matching-related methods to [UIStatus].
extension UIStatusPatterns on UIStatus {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UIInitial value)? initial,
    TResult Function(UILoading value)? loading,
    TResult Function(UILoadFailed value)? loadFailed,
    TResult Function(UILoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial() when initial != null:
        return initial(_that);
      case UILoading() when loading != null:
        return loading(_that);
      case UILoadFailed() when loadFailed != null:
        return loadFailed(_that);
      case UILoadSuccess() when loadSuccess != null:
        return loadSuccess(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UIInitial value) initial,
    required TResult Function(UILoading value) loading,
    required TResult Function(UILoadFailed value) loadFailed,
    required TResult Function(UILoadSuccess value) loadSuccess,
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial():
        return initial(_that);
      case UILoading():
        return loading(_that);
      case UILoadFailed():
        return loadFailed(_that);
      case UILoadSuccess():
        return loadSuccess(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UIInitial value)? initial,
    TResult? Function(UILoading value)? loading,
    TResult? Function(UILoadFailed value)? loadFailed,
    TResult? Function(UILoadSuccess value)? loadSuccess,
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial() when initial != null:
        return initial(_that);
      case UILoading() when loading != null:
        return loading(_that);
      case UILoadFailed() when loadFailed != null:
        return loadFailed(_that);
      case UILoadSuccess() when loadSuccess != null:
        return loadSuccess(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loadFailed,
    TResult Function(String? message)? loadSuccess,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial() when initial != null:
        return initial();
      case UILoading() when loading != null:
        return loading();
      case UILoadFailed() when loadFailed != null:
        return loadFailed(_that.message);
      case UILoadSuccess() when loadSuccess != null:
        return loadSuccess(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loadFailed,
    required TResult Function(String? message) loadSuccess,
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial():
        return initial();
      case UILoading():
        return loading();
      case UILoadFailed():
        return loadFailed(_that.message);
      case UILoadSuccess():
        return loadSuccess(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loadFailed,
    TResult? Function(String? message)? loadSuccess,
  }) {
    final _that = this;
    switch (_that) {
      case UIInitial() when initial != null:
        return initial();
      case UILoading() when loading != null:
        return loading();
      case UILoadFailed() when loadFailed != null:
        return loadFailed(_that.message);
      case UILoadSuccess() when loadSuccess != null:
        return loadSuccess(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class UIInitial implements UIStatus {
  const UIInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UIInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UIStatus.initial()';
  }
}

/// @nodoc

class UILoading implements UIStatus {
  const UILoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UILoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UIStatus.loading()';
  }
}

/// @nodoc

class UILoadFailed implements UIStatus {
  const UILoadFailed({required this.message});

  final String message;

  /// Create a copy of UIStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UILoadFailedCopyWith<UILoadFailed> get copyWith =>
      _$UILoadFailedCopyWithImpl<UILoadFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UILoadFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UIStatus.loadFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UILoadFailedCopyWith<$Res>
    implements $UIStatusCopyWith<$Res> {
  factory $UILoadFailedCopyWith(
          UILoadFailed value, $Res Function(UILoadFailed) _then) =
      _$UILoadFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UILoadFailedCopyWithImpl<$Res> implements $UILoadFailedCopyWith<$Res> {
  _$UILoadFailedCopyWithImpl(this._self, this._then);

  final UILoadFailed _self;
  final $Res Function(UILoadFailed) _then;

  /// Create a copy of UIStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UILoadFailed(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UILoadSuccess implements UIStatus {
  const UILoadSuccess({this.message});

  final String? message;

  /// Create a copy of UIStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UILoadSuccessCopyWith<UILoadSuccess> get copyWith =>
      _$UILoadSuccessCopyWithImpl<UILoadSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UILoadSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UIStatus.loadSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UILoadSuccessCopyWith<$Res>
    implements $UIStatusCopyWith<$Res> {
  factory $UILoadSuccessCopyWith(
          UILoadSuccess value, $Res Function(UILoadSuccess) _then) =
      _$UILoadSuccessCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$UILoadSuccessCopyWithImpl<$Res>
    implements $UILoadSuccessCopyWith<$Res> {
  _$UILoadSuccessCopyWithImpl(this._self, this._then);

  final UILoadSuccess _self;
  final $Res Function(UILoadSuccess) _then;

  /// Create a copy of UIStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(UILoadSuccess(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
