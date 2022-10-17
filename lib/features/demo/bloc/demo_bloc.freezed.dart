// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'demo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DemoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadImageFromDB,
    required TResult Function(String message) deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DemoLoadImageFromDB value) loadImageFromDB,
    required TResult Function(DemoDeleteImageFromDB value) deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoEventCopyWith<$Res> {
  factory $DemoEventCopyWith(DemoEvent value, $Res Function(DemoEvent) then) =
      _$DemoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DemoEventCopyWithImpl<$Res> implements $DemoEventCopyWith<$Res> {
  _$DemoEventCopyWithImpl(this._value, this._then);

  final DemoEvent _value;
  // ignore: unused_field
  final $Res Function(DemoEvent) _then;
}

/// @nodoc
abstract class _$$DemoLoadImageFromDBCopyWith<$Res> {
  factory _$$DemoLoadImageFromDBCopyWith(_$DemoLoadImageFromDB value,
          $Res Function(_$DemoLoadImageFromDB) then) =
      __$$DemoLoadImageFromDBCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DemoLoadImageFromDBCopyWithImpl<$Res>
    extends _$DemoEventCopyWithImpl<$Res>
    implements _$$DemoLoadImageFromDBCopyWith<$Res> {
  __$$DemoLoadImageFromDBCopyWithImpl(
      _$DemoLoadImageFromDB _value, $Res Function(_$DemoLoadImageFromDB) _then)
      : super(_value, (v) => _then(v as _$DemoLoadImageFromDB));

  @override
  _$DemoLoadImageFromDB get _value => super._value as _$DemoLoadImageFromDB;
}

/// @nodoc

class _$DemoLoadImageFromDB implements DemoLoadImageFromDB {
  const _$DemoLoadImageFromDB();

  @override
  String toString() {
    return 'DemoEvent.loadImageFromDB()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DemoLoadImageFromDB);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadImageFromDB,
    required TResult Function(String message) deleteImageFromDB,
  }) {
    return loadImageFromDB();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
  }) {
    return loadImageFromDB?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (loadImageFromDB != null) {
      return loadImageFromDB();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DemoLoadImageFromDB value) loadImageFromDB,
    required TResult Function(DemoDeleteImageFromDB value) deleteImageFromDB,
  }) {
    return loadImageFromDB(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
  }) {
    return loadImageFromDB?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (loadImageFromDB != null) {
      return loadImageFromDB(this);
    }
    return orElse();
  }
}

abstract class DemoLoadImageFromDB implements DemoEvent {
  const factory DemoLoadImageFromDB() = _$DemoLoadImageFromDB;
}

/// @nodoc
abstract class _$$DemoDeleteImageFromDBCopyWith<$Res> {
  factory _$$DemoDeleteImageFromDBCopyWith(_$DemoDeleteImageFromDB value,
          $Res Function(_$DemoDeleteImageFromDB) then) =
      __$$DemoDeleteImageFromDBCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$DemoDeleteImageFromDBCopyWithImpl<$Res>
    extends _$DemoEventCopyWithImpl<$Res>
    implements _$$DemoDeleteImageFromDBCopyWith<$Res> {
  __$$DemoDeleteImageFromDBCopyWithImpl(_$DemoDeleteImageFromDB _value,
      $Res Function(_$DemoDeleteImageFromDB) _then)
      : super(_value, (v) => _then(v as _$DemoDeleteImageFromDB));

  @override
  _$DemoDeleteImageFromDB get _value => super._value as _$DemoDeleteImageFromDB;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DemoDeleteImageFromDB(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DemoDeleteImageFromDB implements DemoDeleteImageFromDB {
  const _$DemoDeleteImageFromDB(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DemoEvent.deleteImageFromDB(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemoDeleteImageFromDB &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$DemoDeleteImageFromDBCopyWith<_$DemoDeleteImageFromDB> get copyWith =>
      __$$DemoDeleteImageFromDBCopyWithImpl<_$DemoDeleteImageFromDB>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadImageFromDB,
    required TResult Function(String message) deleteImageFromDB,
  }) {
    return deleteImageFromDB(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
  }) {
    return deleteImageFromDB?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(String message)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (deleteImageFromDB != null) {
      return deleteImageFromDB(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DemoLoadImageFromDB value) loadImageFromDB,
    required TResult Function(DemoDeleteImageFromDB value) deleteImageFromDB,
  }) {
    return deleteImageFromDB(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
  }) {
    return deleteImageFromDB?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DemoLoadImageFromDB value)? loadImageFromDB,
    TResult Function(DemoDeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (deleteImageFromDB != null) {
      return deleteImageFromDB(this);
    }
    return orElse();
  }
}

abstract class DemoDeleteImageFromDB implements DemoEvent {
  const factory DemoDeleteImageFromDB(final String message) =
      _$DemoDeleteImageFromDB;

  String get message;
  @JsonKey(ignore: true)
  _$$DemoDeleteImageFromDBCopyWith<_$DemoDeleteImageFromDB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DemoState {
  UIStatus get status => throw _privateConstructorUsedError;
  List<DogImage> get images => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  bool get isBusy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemoStateCopyWith<DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoStateCopyWith<$Res> {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) then) =
      _$DemoStateCopyWithImpl<$Res>;
  $Res call(
      {UIStatus status,
      List<DogImage> images,
      String? errorMsg,
      String? successMsg,
      bool isBusy});
}

/// @nodoc
class _$DemoStateCopyWithImpl<$Res> implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._value, this._then);

  final DemoState _value;
  // ignore: unused_field
  final $Res Function(DemoState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? images = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
    Object? isBusy = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: successMsg == freezed
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DemoStateCopyWith<$Res> implements $DemoStateCopyWith<$Res> {
  factory _$$_DemoStateCopyWith(
          _$_DemoState value, $Res Function(_$_DemoState) then) =
      __$$_DemoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UIStatus status,
      List<DogImage> images,
      String? errorMsg,
      String? successMsg,
      bool isBusy});
}

/// @nodoc
class __$$_DemoStateCopyWithImpl<$Res> extends _$DemoStateCopyWithImpl<$Res>
    implements _$$_DemoStateCopyWith<$Res> {
  __$$_DemoStateCopyWithImpl(
      _$_DemoState _value, $Res Function(_$_DemoState) _then)
      : super(_value, (v) => _then(v as _$_DemoState));

  @override
  _$_DemoState get _value => super._value as _$_DemoState;

  @override
  $Res call({
    Object? status = freezed,
    Object? images = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
    Object? isBusy = freezed,
  }) {
    return _then(_$_DemoState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: successMsg == freezed
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DemoState implements _DemoState {
  const _$_DemoState(
      {this.status = UIStatus.initial,
      final List<DogImage> images = const [],
      this.errorMsg,
      this.successMsg,
      this.isBusy = false})
      : _images = images;

  @override
  @JsonKey()
  final UIStatus status;
  final List<DogImage> _images;
  @override
  @JsonKey()
  List<DogImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? errorMsg;
  @override
  final String? successMsg;
  @override
  @JsonKey()
  final bool isBusy;

  @override
  String toString() {
    return 'DemoState(status: $status, images: $images, errorMsg: $errorMsg, successMsg: $successMsg, isBusy: $isBusy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DemoState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality()
                .equals(other.successMsg, successMsg) &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(successMsg),
      const DeepCollectionEquality().hash(isBusy));

  @JsonKey(ignore: true)
  @override
  _$$_DemoStateCopyWith<_$_DemoState> get copyWith =>
      __$$_DemoStateCopyWithImpl<_$_DemoState>(this, _$identity);
}

abstract class _DemoState implements DemoState {
  const factory _DemoState(
      {final UIStatus status,
      final List<DogImage> images,
      final String? errorMsg,
      final String? successMsg,
      final bool isBusy}) = _$_DemoState;

  @override
  UIStatus get status;
  @override
  List<DogImage> get images;
  @override
  String? get errorMsg;
  @override
  String? get successMsg;
  @override
  bool get isBusy;
  @override
  @JsonKey(ignore: true)
  _$$_DemoStateCopyWith<_$_DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}
