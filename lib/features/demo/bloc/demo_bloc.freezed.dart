// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(DogImage dogImage) deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadImageFromDB,
    TResult? Function(DogImage dogImage)? deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(DogImage dogImage)? deleteImageFromDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadImageFromDB value) loadImageFromDB,
    required TResult Function(_DeleteImageFromDB value) deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult? Function(_DeleteImageFromDB value)? deleteImageFromDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult Function(_DeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoEventCopyWith<$Res> {
  factory $DemoEventCopyWith(DemoEvent value, $Res Function(DemoEvent) then) =
      _$DemoEventCopyWithImpl<$Res, DemoEvent>;
}

/// @nodoc
class _$DemoEventCopyWithImpl<$Res, $Val extends DemoEvent>
    implements $DemoEventCopyWith<$Res> {
  _$DemoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadImageFromDBCopyWith<$Res> {
  factory _$$_LoadImageFromDBCopyWith(
          _$_LoadImageFromDB value, $Res Function(_$_LoadImageFromDB) then) =
      __$$_LoadImageFromDBCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadImageFromDBCopyWithImpl<$Res>
    extends _$DemoEventCopyWithImpl<$Res, _$_LoadImageFromDB>
    implements _$$_LoadImageFromDBCopyWith<$Res> {
  __$$_LoadImageFromDBCopyWithImpl(
      _$_LoadImageFromDB _value, $Res Function(_$_LoadImageFromDB) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadImageFromDB implements _LoadImageFromDB {
  const _$_LoadImageFromDB();

  @override
  String toString() {
    return 'DemoEvent.loadImageFromDB()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadImageFromDB);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadImageFromDB,
    required TResult Function(DogImage dogImage) deleteImageFromDB,
  }) {
    return loadImageFromDB();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadImageFromDB,
    TResult? Function(DogImage dogImage)? deleteImageFromDB,
  }) {
    return loadImageFromDB?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(DogImage dogImage)? deleteImageFromDB,
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
    required TResult Function(_LoadImageFromDB value) loadImageFromDB,
    required TResult Function(_DeleteImageFromDB value) deleteImageFromDB,
  }) {
    return loadImageFromDB(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult? Function(_DeleteImageFromDB value)? deleteImageFromDB,
  }) {
    return loadImageFromDB?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult Function(_DeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (loadImageFromDB != null) {
      return loadImageFromDB(this);
    }
    return orElse();
  }
}

abstract class _LoadImageFromDB implements DemoEvent {
  const factory _LoadImageFromDB() = _$_LoadImageFromDB;
}

/// @nodoc
abstract class _$$_DeleteImageFromDBCopyWith<$Res> {
  factory _$$_DeleteImageFromDBCopyWith(_$_DeleteImageFromDB value,
          $Res Function(_$_DeleteImageFromDB) then) =
      __$$_DeleteImageFromDBCopyWithImpl<$Res>;
  @useResult
  $Res call({DogImage dogImage});

  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class __$$_DeleteImageFromDBCopyWithImpl<$Res>
    extends _$DemoEventCopyWithImpl<$Res, _$_DeleteImageFromDB>
    implements _$$_DeleteImageFromDBCopyWith<$Res> {
  __$$_DeleteImageFromDBCopyWithImpl(
      _$_DeleteImageFromDB _value, $Res Function(_$_DeleteImageFromDB) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogImage = null,
  }) {
    return _then(_$_DeleteImageFromDB(
      dogImage: null == dogImage
          ? _value.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DogImageCopyWith<$Res> get dogImage {
    return $DogImageCopyWith<$Res>(_value.dogImage, (value) {
      return _then(_value.copyWith(dogImage: value));
    });
  }
}

/// @nodoc

class _$_DeleteImageFromDB implements _DeleteImageFromDB {
  const _$_DeleteImageFromDB({required this.dogImage});

  @override
  final DogImage dogImage;

  @override
  String toString() {
    return 'DemoEvent.deleteImageFromDB(dogImage: $dogImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteImageFromDB &&
            (identical(other.dogImage, dogImage) ||
                other.dogImage == dogImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dogImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteImageFromDBCopyWith<_$_DeleteImageFromDB> get copyWith =>
      __$$_DeleteImageFromDBCopyWithImpl<_$_DeleteImageFromDB>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadImageFromDB,
    required TResult Function(DogImage dogImage) deleteImageFromDB,
  }) {
    return deleteImageFromDB(dogImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadImageFromDB,
    TResult? Function(DogImage dogImage)? deleteImageFromDB,
  }) {
    return deleteImageFromDB?.call(dogImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadImageFromDB,
    TResult Function(DogImage dogImage)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (deleteImageFromDB != null) {
      return deleteImageFromDB(dogImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadImageFromDB value) loadImageFromDB,
    required TResult Function(_DeleteImageFromDB value) deleteImageFromDB,
  }) {
    return deleteImageFromDB(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult? Function(_DeleteImageFromDB value)? deleteImageFromDB,
  }) {
    return deleteImageFromDB?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult Function(_DeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    if (deleteImageFromDB != null) {
      return deleteImageFromDB(this);
    }
    return orElse();
  }
}

abstract class _DeleteImageFromDB implements DemoEvent {
  const factory _DeleteImageFromDB({required final DogImage dogImage}) =
      _$_DeleteImageFromDB;

  DogImage get dogImage;
  @JsonKey(ignore: true)
  _$$_DeleteImageFromDBCopyWith<_$_DeleteImageFromDB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DemoState {
  UIStatus get status => throw _privateConstructorUsedError;
  DemoNotification? get notification => throw _privateConstructorUsedError;
  List<DogImage> get images => throw _privateConstructorUsedError;
  bool get isBusy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemoStateCopyWith<DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoStateCopyWith<$Res> {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) then) =
      _$DemoStateCopyWithImpl<$Res, DemoState>;
  @useResult
  $Res call(
      {UIStatus status,
      DemoNotification? notification,
      List<DogImage> images,
      bool isBusy});

  $UIStatusCopyWith<$Res> get status;
  $DemoNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class _$DemoStateCopyWithImpl<$Res, $Val extends DemoState>
    implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? images = null,
    Object? isBusy = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DemoNotification?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DemoNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $DemoNotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DemoStateCopyWith<$Res> implements $DemoStateCopyWith<$Res> {
  factory _$$_DemoStateCopyWith(
          _$_DemoState value, $Res Function(_$_DemoState) then) =
      __$$_DemoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIStatus status,
      DemoNotification? notification,
      List<DogImage> images,
      bool isBusy});

  @override
  $UIStatusCopyWith<$Res> get status;
  @override
  $DemoNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class __$$_DemoStateCopyWithImpl<$Res>
    extends _$DemoStateCopyWithImpl<$Res, _$_DemoState>
    implements _$$_DemoStateCopyWith<$Res> {
  __$$_DemoStateCopyWithImpl(
      _$_DemoState _value, $Res Function(_$_DemoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? images = null,
    Object? isBusy = null,
  }) {
    return _then(_$_DemoState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DemoNotification?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DemoState implements _DemoState {
  const _$_DemoState(
      {this.status = const UIInitial(),
      this.notification,
      final List<DogImage> images = const [],
      this.isBusy = false})
      : _images = images;

  @override
  @JsonKey()
  final UIStatus status;
  @override
  final DemoNotification? notification;
  final List<DogImage> _images;
  @override
  @JsonKey()
  List<DogImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool isBusy;

  @override
  String toString() {
    return 'DemoState(status: $status, notification: $notification, images: $images, isBusy: $isBusy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DemoState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, notification,
      const DeepCollectionEquality().hash(_images), isBusy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DemoStateCopyWith<_$_DemoState> get copyWith =>
      __$$_DemoStateCopyWithImpl<_$_DemoState>(this, _$identity);
}

abstract class _DemoState implements DemoState {
  const factory _DemoState(
      {final UIStatus status,
      final DemoNotification? notification,
      final List<DogImage> images,
      final bool isBusy}) = _$_DemoState;

  @override
  UIStatus get status;
  @override
  DemoNotification? get notification;
  @override
  List<DogImage> get images;
  @override
  bool get isBusy;
  @override
  @JsonKey(ignore: true)
  _$$_DemoStateCopyWith<_$_DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DemoNotification {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) insertSuccess,
    required TResult Function(String message) insertFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? insertSuccess,
    TResult? Function(String message)? insertFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? insertSuccess,
    TResult Function(String message)? insertFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInsertSuccess value) insertSuccess,
    required TResult Function(_NotificationInsertFailed value) insertFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult? Function(_NotificationInsertFailed value)? insertFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult Function(_NotificationInsertFailed value)? insertFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemoNotificationCopyWith<DemoNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoNotificationCopyWith<$Res> {
  factory $DemoNotificationCopyWith(
          DemoNotification value, $Res Function(DemoNotification) then) =
      _$DemoNotificationCopyWithImpl<$Res, DemoNotification>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DemoNotificationCopyWithImpl<$Res, $Val extends DemoNotification>
    implements $DemoNotificationCopyWith<$Res> {
  _$DemoNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationInsertSuccessCopyWith<$Res>
    implements $DemoNotificationCopyWith<$Res> {
  factory _$$_NotificationInsertSuccessCopyWith(
          _$_NotificationInsertSuccess value,
          $Res Function(_$_NotificationInsertSuccess) then) =
      __$$_NotificationInsertSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NotificationInsertSuccessCopyWithImpl<$Res>
    extends _$DemoNotificationCopyWithImpl<$Res, _$_NotificationInsertSuccess>
    implements _$$_NotificationInsertSuccessCopyWith<$Res> {
  __$$_NotificationInsertSuccessCopyWithImpl(
      _$_NotificationInsertSuccess _value,
      $Res Function(_$_NotificationInsertSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NotificationInsertSuccess(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotificationInsertSuccess implements _NotificationInsertSuccess {
  _$_NotificationInsertSuccess({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DemoNotification.insertSuccess(message: $message)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationInsertSuccessCopyWith<_$_NotificationInsertSuccess>
      get copyWith => __$$_NotificationInsertSuccessCopyWithImpl<
          _$_NotificationInsertSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) insertSuccess,
    required TResult Function(String message) insertFailed,
  }) {
    return insertSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? insertSuccess,
    TResult? Function(String message)? insertFailed,
  }) {
    return insertSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? insertSuccess,
    TResult Function(String message)? insertFailed,
    required TResult orElse(),
  }) {
    if (insertSuccess != null) {
      return insertSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInsertSuccess value) insertSuccess,
    required TResult Function(_NotificationInsertFailed value) insertFailed,
  }) {
    return insertSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult? Function(_NotificationInsertFailed value)? insertFailed,
  }) {
    return insertSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult Function(_NotificationInsertFailed value)? insertFailed,
    required TResult orElse(),
  }) {
    if (insertSuccess != null) {
      return insertSuccess(this);
    }
    return orElse();
  }
}

abstract class _NotificationInsertSuccess implements DemoNotification {
  factory _NotificationInsertSuccess({required final String message}) =
      _$_NotificationInsertSuccess;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationInsertSuccessCopyWith<_$_NotificationInsertSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationInsertFailedCopyWith<$Res>
    implements $DemoNotificationCopyWith<$Res> {
  factory _$$_NotificationInsertFailedCopyWith(
          _$_NotificationInsertFailed value,
          $Res Function(_$_NotificationInsertFailed) then) =
      __$$_NotificationInsertFailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NotificationInsertFailedCopyWithImpl<$Res>
    extends _$DemoNotificationCopyWithImpl<$Res, _$_NotificationInsertFailed>
    implements _$$_NotificationInsertFailedCopyWith<$Res> {
  __$$_NotificationInsertFailedCopyWithImpl(_$_NotificationInsertFailed _value,
      $Res Function(_$_NotificationInsertFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NotificationInsertFailed(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotificationInsertFailed implements _NotificationInsertFailed {
  _$_NotificationInsertFailed({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DemoNotification.insertFailed(message: $message)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationInsertFailedCopyWith<_$_NotificationInsertFailed>
      get copyWith => __$$_NotificationInsertFailedCopyWithImpl<
          _$_NotificationInsertFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) insertSuccess,
    required TResult Function(String message) insertFailed,
  }) {
    return insertFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? insertSuccess,
    TResult? Function(String message)? insertFailed,
  }) {
    return insertFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? insertSuccess,
    TResult Function(String message)? insertFailed,
    required TResult orElse(),
  }) {
    if (insertFailed != null) {
      return insertFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInsertSuccess value) insertSuccess,
    required TResult Function(_NotificationInsertFailed value) insertFailed,
  }) {
    return insertFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult? Function(_NotificationInsertFailed value)? insertFailed,
  }) {
    return insertFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult Function(_NotificationInsertFailed value)? insertFailed,
    required TResult orElse(),
  }) {
    if (insertFailed != null) {
      return insertFailed(this);
    }
    return orElse();
  }
}

abstract class _NotificationInsertFailed implements DemoNotification {
  factory _NotificationInsertFailed({required final String message}) =
      _$_NotificationInsertFailed;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationInsertFailedCopyWith<_$_NotificationInsertFailed>
      get copyWith => throw _privateConstructorUsedError;
}
