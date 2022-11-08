// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dog_image_random_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DogImageRandomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(bool insertDb) randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DogImageRandomLoaded value) loaded,
    required TResult Function(DogImageRandomRandomRequested value)
        randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageRandomEventCopyWith<$Res> {
  factory $DogImageRandomEventCopyWith(
          DogImageRandomEvent value, $Res Function(DogImageRandomEvent) then) =
      _$DogImageRandomEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DogImageRandomEventCopyWithImpl<$Res>
    implements $DogImageRandomEventCopyWith<$Res> {
  _$DogImageRandomEventCopyWithImpl(this._value, this._then);

  final DogImageRandomEvent _value;
  // ignore: unused_field
  final $Res Function(DogImageRandomEvent) _then;
}

/// @nodoc
abstract class _$$DogImageRandomLoadedCopyWith<$Res> {
  factory _$$DogImageRandomLoadedCopyWith(_$DogImageRandomLoaded value,
          $Res Function(_$DogImageRandomLoaded) then) =
      __$$DogImageRandomLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DogImageRandomLoadedCopyWithImpl<$Res>
    extends _$DogImageRandomEventCopyWithImpl<$Res>
    implements _$$DogImageRandomLoadedCopyWith<$Res> {
  __$$DogImageRandomLoadedCopyWithImpl(_$DogImageRandomLoaded _value,
      $Res Function(_$DogImageRandomLoaded) _then)
      : super(_value, (v) => _then(v as _$DogImageRandomLoaded));

  @override
  _$DogImageRandomLoaded get _value => super._value as _$DogImageRandomLoaded;
}

/// @nodoc

class _$DogImageRandomLoaded implements DogImageRandomLoaded {
  const _$DogImageRandomLoaded();

  @override
  String toString() {
    return 'DogImageRandomEvent.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DogImageRandomLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(bool insertDb) randomRequested,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DogImageRandomLoaded value) loaded,
    required TResult Function(DogImageRandomRandomRequested value)
        randomRequested,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DogImageRandomLoaded implements DogImageRandomEvent {
  const factory DogImageRandomLoaded() = _$DogImageRandomLoaded;
}

/// @nodoc
abstract class _$$DogImageRandomRandomRequestedCopyWith<$Res> {
  factory _$$DogImageRandomRandomRequestedCopyWith(
          _$DogImageRandomRandomRequested value,
          $Res Function(_$DogImageRandomRandomRequested) then) =
      __$$DogImageRandomRandomRequestedCopyWithImpl<$Res>;
  $Res call({bool insertDb});
}

/// @nodoc
class __$$DogImageRandomRandomRequestedCopyWithImpl<$Res>
    extends _$DogImageRandomEventCopyWithImpl<$Res>
    implements _$$DogImageRandomRandomRequestedCopyWith<$Res> {
  __$$DogImageRandomRandomRequestedCopyWithImpl(
      _$DogImageRandomRandomRequested _value,
      $Res Function(_$DogImageRandomRandomRequested) _then)
      : super(_value, (v) => _then(v as _$DogImageRandomRandomRequested));

  @override
  _$DogImageRandomRandomRequested get _value =>
      super._value as _$DogImageRandomRandomRequested;

  @override
  $Res call({
    Object? insertDb = freezed,
  }) {
    return _then(_$DogImageRandomRandomRequested(
      insertDb: insertDb == freezed
          ? _value.insertDb
          : insertDb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DogImageRandomRandomRequested implements DogImageRandomRandomRequested {
  const _$DogImageRandomRandomRequested({this.insertDb = false});

  @override
  @JsonKey()
  final bool insertDb;

  @override
  String toString() {
    return 'DogImageRandomEvent.randomRequested(insertDb: $insertDb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogImageRandomRandomRequested &&
            const DeepCollectionEquality().equals(other.insertDb, insertDb));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(insertDb));

  @JsonKey(ignore: true)
  @override
  _$$DogImageRandomRandomRequestedCopyWith<_$DogImageRandomRandomRequested>
      get copyWith => __$$DogImageRandomRandomRequestedCopyWithImpl<
          _$DogImageRandomRandomRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(bool insertDb) randomRequested,
  }) {
    return randomRequested(insertDb);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
  }) {
    return randomRequested?.call(insertDb);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
    required TResult orElse(),
  }) {
    if (randomRequested != null) {
      return randomRequested(insertDb);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DogImageRandomLoaded value) loaded,
    required TResult Function(DogImageRandomRandomRequested value)
        randomRequested,
  }) {
    return randomRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
  }) {
    return randomRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DogImageRandomLoaded value)? loaded,
    TResult Function(DogImageRandomRandomRequested value)? randomRequested,
    required TResult orElse(),
  }) {
    if (randomRequested != null) {
      return randomRequested(this);
    }
    return orElse();
  }
}

abstract class DogImageRandomRandomRequested implements DogImageRandomEvent {
  const factory DogImageRandomRandomRequested({final bool insertDb}) =
      _$DogImageRandomRandomRequested;

  bool get insertDb;
  @JsonKey(ignore: true)
  _$$DogImageRandomRandomRequestedCopyWith<_$DogImageRandomRandomRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DogImageRandomState {
  UIStatus get status => throw _privateConstructorUsedError;
  DogImage get dogImage => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DogImageRandomStateCopyWith<DogImageRandomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageRandomStateCopyWith<$Res> {
  factory $DogImageRandomStateCopyWith(
          DogImageRandomState value, $Res Function(DogImageRandomState) then) =
      _$DogImageRandomStateCopyWithImpl<$Res>;
  $Res call(
      {UIStatus status,
      DogImage dogImage,
      String? errorMsg,
      String? successMsg});

  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class _$DogImageRandomStateCopyWithImpl<$Res>
    implements $DogImageRandomStateCopyWith<$Res> {
  _$DogImageRandomStateCopyWithImpl(this._value, this._then);

  final DogImageRandomState _value;
  // ignore: unused_field
  final $Res Function(DogImageRandomState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? dogImage = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      dogImage: dogImage == freezed
          ? _value.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: successMsg == freezed
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $DogImageCopyWith<$Res> get dogImage {
    return $DogImageCopyWith<$Res>(_value.dogImage, (value) {
      return _then(_value.copyWith(dogImage: value));
    });
  }
}

/// @nodoc
abstract class _$$_DogImageRandomStateCopyWith<$Res>
    implements $DogImageRandomStateCopyWith<$Res> {
  factory _$$_DogImageRandomStateCopyWith(_$_DogImageRandomState value,
          $Res Function(_$_DogImageRandomState) then) =
      __$$_DogImageRandomStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UIStatus status,
      DogImage dogImage,
      String? errorMsg,
      String? successMsg});

  @override
  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class __$$_DogImageRandomStateCopyWithImpl<$Res>
    extends _$DogImageRandomStateCopyWithImpl<$Res>
    implements _$$_DogImageRandomStateCopyWith<$Res> {
  __$$_DogImageRandomStateCopyWithImpl(_$_DogImageRandomState _value,
      $Res Function(_$_DogImageRandomState) _then)
      : super(_value, (v) => _then(v as _$_DogImageRandomState));

  @override
  _$_DogImageRandomState get _value => super._value as _$_DogImageRandomState;

  @override
  $Res call({
    Object? status = freezed,
    Object? dogImage = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
  }) {
    return _then(_$_DogImageRandomState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      dogImage: dogImage == freezed
          ? _value.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: successMsg == freezed
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DogImageRandomState implements _DogImageRandomState {
  const _$_DogImageRandomState(
      {this.status = UIStatus.initial,
      required this.dogImage,
      this.errorMsg,
      this.successMsg});

  @override
  @JsonKey()
  final UIStatus status;
  @override
  final DogImage dogImage;
  @override
  final String? errorMsg;
  @override
  final String? successMsg;

  @override
  String toString() {
    return 'DogImageRandomState(status: $status, dogImage: $dogImage, errorMsg: $errorMsg, successMsg: $successMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DogImageRandomState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.dogImage, dogImage) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality()
                .equals(other.successMsg, successMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(dogImage),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(successMsg));

  @JsonKey(ignore: true)
  @override
  _$$_DogImageRandomStateCopyWith<_$_DogImageRandomState> get copyWith =>
      __$$_DogImageRandomStateCopyWithImpl<_$_DogImageRandomState>(
          this, _$identity);
}

abstract class _DogImageRandomState implements DogImageRandomState {
  const factory _DogImageRandomState(
      {final UIStatus status,
      required final DogImage dogImage,
      final String? errorMsg,
      final String? successMsg}) = _$_DogImageRandomState;

  @override
  UIStatus get status;
  @override
  DogImage get dogImage;
  @override
  String? get errorMsg;
  @override
  String? get successMsg;
  @override
  @JsonKey(ignore: true)
  _$$_DogImageRandomStateCopyWith<_$_DogImageRandomState> get copyWith =>
      throw _privateConstructorUsedError;
}
