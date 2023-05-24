// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function()? loaded,
    TResult? Function(bool insertDb)? randomRequested,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RandomRequested value) randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RandomRequested value)? randomRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RandomRequested value)? randomRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageRandomEventCopyWith<$Res> {
  factory $DogImageRandomEventCopyWith(
          DogImageRandomEvent value, $Res Function(DogImageRandomEvent) then) =
      _$DogImageRandomEventCopyWithImpl<$Res, DogImageRandomEvent>;
}

/// @nodoc
class _$DogImageRandomEventCopyWithImpl<$Res, $Val extends DogImageRandomEvent>
    implements $DogImageRandomEventCopyWith<$Res> {
  _$DogImageRandomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$DogImageRandomEventCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loaded with DiagnosticableTreeMixin implements _Loaded {
  const _$_Loaded();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomEvent.loaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DogImageRandomEvent.loaded'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loaded);
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
    TResult? Function()? loaded,
    TResult? Function(bool insertDb)? randomRequested,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RandomRequested value) randomRequested,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RandomRequested value)? randomRequested,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RandomRequested value)? randomRequested,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements DogImageRandomEvent {
  const factory _Loaded() = _$_Loaded;
}

/// @nodoc
abstract class _$$_RandomRequestedCopyWith<$Res> {
  factory _$$_RandomRequestedCopyWith(
          _$_RandomRequested value, $Res Function(_$_RandomRequested) then) =
      __$$_RandomRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool insertDb});
}

/// @nodoc
class __$$_RandomRequestedCopyWithImpl<$Res>
    extends _$DogImageRandomEventCopyWithImpl<$Res, _$_RandomRequested>
    implements _$$_RandomRequestedCopyWith<$Res> {
  __$$_RandomRequestedCopyWithImpl(
      _$_RandomRequested _value, $Res Function(_$_RandomRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insertDb = null,
  }) {
    return _then(_$_RandomRequested(
      insertDb: null == insertDb
          ? _value.insertDb
          : insertDb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RandomRequested
    with DiagnosticableTreeMixin
    implements _RandomRequested {
  const _$_RandomRequested({this.insertDb = false});

  @override
  @JsonKey()
  final bool insertDb;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomEvent.randomRequested(insertDb: $insertDb)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomEvent.randomRequested'))
      ..add(DiagnosticsProperty('insertDb', insertDb));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RandomRequested &&
            (identical(other.insertDb, insertDb) ||
                other.insertDb == insertDb));
  }

  @override
  int get hashCode => Object.hash(runtimeType, insertDb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RandomRequestedCopyWith<_$_RandomRequested> get copyWith =>
      __$$_RandomRequestedCopyWithImpl<_$_RandomRequested>(this, _$identity);

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
    TResult? Function()? loaded,
    TResult? Function(bool insertDb)? randomRequested,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RandomRequested value) randomRequested,
  }) {
    return randomRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RandomRequested value)? randomRequested,
  }) {
    return randomRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RandomRequested value)? randomRequested,
    required TResult orElse(),
  }) {
    if (randomRequested != null) {
      return randomRequested(this);
    }
    return orElse();
  }
}

abstract class _RandomRequested implements DogImageRandomEvent {
  const factory _RandomRequested({final bool insertDb}) = _$_RandomRequested;

  bool get insertDb;
  @JsonKey(ignore: true)
  _$$_RandomRequestedCopyWith<_$_RandomRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DogImageRandomState {
  UIStatus get status => throw _privateConstructorUsedError;
  DogImageRandomNotification? get notification =>
      throw _privateConstructorUsedError;
  DogImage get dogImage => throw _privateConstructorUsedError;
  bool get isBusy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DogImageRandomStateCopyWith<DogImageRandomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageRandomStateCopyWith<$Res> {
  factory $DogImageRandomStateCopyWith(
          DogImageRandomState value, $Res Function(DogImageRandomState) then) =
      _$DogImageRandomStateCopyWithImpl<$Res, DogImageRandomState>;
  @useResult
  $Res call(
      {UIStatus status,
      DogImageRandomNotification? notification,
      DogImage dogImage,
      bool isBusy});

  $UIStatusCopyWith<$Res> get status;
  $DogImageRandomNotificationCopyWith<$Res>? get notification;
  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class _$DogImageRandomStateCopyWithImpl<$Res, $Val extends DogImageRandomState>
    implements $DogImageRandomStateCopyWith<$Res> {
  _$DogImageRandomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? dogImage = null,
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
              as DogImageRandomNotification?,
      dogImage: null == dogImage
          ? _value.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
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
  $DogImageRandomNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $DogImageRandomNotificationCopyWith<$Res>(_value.notification!,
        (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DogImageCopyWith<$Res> get dogImage {
    return $DogImageCopyWith<$Res>(_value.dogImage, (value) {
      return _then(_value.copyWith(dogImage: value) as $Val);
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
  @useResult
  $Res call(
      {UIStatus status,
      DogImageRandomNotification? notification,
      DogImage dogImage,
      bool isBusy});

  @override
  $UIStatusCopyWith<$Res> get status;
  @override
  $DogImageRandomNotificationCopyWith<$Res>? get notification;
  @override
  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class __$$_DogImageRandomStateCopyWithImpl<$Res>
    extends _$DogImageRandomStateCopyWithImpl<$Res, _$_DogImageRandomState>
    implements _$$_DogImageRandomStateCopyWith<$Res> {
  __$$_DogImageRandomStateCopyWithImpl(_$_DogImageRandomState _value,
      $Res Function(_$_DogImageRandomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? dogImage = null,
    Object? isBusy = null,
  }) {
    return _then(_$_DogImageRandomState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DogImageRandomNotification?,
      dogImage: null == dogImage
          ? _value.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DogImageRandomState
    with DiagnosticableTreeMixin
    implements _DogImageRandomState {
  const _$_DogImageRandomState(
      {this.status = const UIInitial(),
      this.notification,
      this.dogImage = const DogImage(message: '', status: ''),
      this.isBusy = false});

  @override
  @JsonKey()
  final UIStatus status;
  @override
  final DogImageRandomNotification? notification;
  @override
  @JsonKey()
  final DogImage dogImage;
  @override
  @JsonKey()
  final bool isBusy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomState(status: $status, notification: $notification, dogImage: $dogImage, isBusy: $isBusy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('notification', notification))
      ..add(DiagnosticsProperty('dogImage', dogImage))
      ..add(DiagnosticsProperty('isBusy', isBusy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DogImageRandomState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.dogImage, dogImage) ||
                other.dogImage == dogImage) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, notification, dogImage, isBusy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DogImageRandomStateCopyWith<_$_DogImageRandomState> get copyWith =>
      __$$_DogImageRandomStateCopyWithImpl<_$_DogImageRandomState>(
          this, _$identity);
}

abstract class _DogImageRandomState implements DogImageRandomState {
  const factory _DogImageRandomState(
      {final UIStatus status,
      final DogImageRandomNotification? notification,
      final DogImage dogImage,
      final bool isBusy}) = _$_DogImageRandomState;

  @override
  UIStatus get status;
  @override
  DogImageRandomNotification? get notification;
  @override
  DogImage get dogImage;
  @override
  bool get isBusy;
  @override
  @JsonKey(ignore: true)
  _$$_DogImageRandomStateCopyWith<_$_DogImageRandomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DogImageRandomNotification {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notifySuccess,
    required TResult Function(String message) notifyFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? notifySuccess,
    TResult? Function(String message)? notifyFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notifySuccess,
    TResult Function(String message)? notifyFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationNotifySuccess value) notifySuccess,
    required TResult Function(_NotificationNotifyFailed value) notifyFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult? Function(_NotificationNotifyFailed value)? notifyFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult Function(_NotificationNotifyFailed value)? notifyFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DogImageRandomNotificationCopyWith<DogImageRandomNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageRandomNotificationCopyWith<$Res> {
  factory $DogImageRandomNotificationCopyWith(DogImageRandomNotification value,
          $Res Function(DogImageRandomNotification) then) =
      _$DogImageRandomNotificationCopyWithImpl<$Res,
          DogImageRandomNotification>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DogImageRandomNotificationCopyWithImpl<$Res,
        $Val extends DogImageRandomNotification>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  _$DogImageRandomNotificationCopyWithImpl(this._value, this._then);

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
abstract class _$$_NotificationNotifySuccessCopyWith<$Res>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  factory _$$_NotificationNotifySuccessCopyWith(
          _$_NotificationNotifySuccess value,
          $Res Function(_$_NotificationNotifySuccess) then) =
      __$$_NotificationNotifySuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NotificationNotifySuccessCopyWithImpl<$Res>
    extends _$DogImageRandomNotificationCopyWithImpl<$Res,
        _$_NotificationNotifySuccess>
    implements _$$_NotificationNotifySuccessCopyWith<$Res> {
  __$$_NotificationNotifySuccessCopyWithImpl(
      _$_NotificationNotifySuccess _value,
      $Res Function(_$_NotificationNotifySuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NotificationNotifySuccess(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotificationNotifySuccess
    with DiagnosticableTreeMixin
    implements _NotificationNotifySuccess {
  _$_NotificationNotifySuccess({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomNotification.notifySuccess(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DogImageRandomNotification.notifySuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationNotifySuccessCopyWith<_$_NotificationNotifySuccess>
      get copyWith => __$$_NotificationNotifySuccessCopyWithImpl<
          _$_NotificationNotifySuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notifySuccess,
    required TResult Function(String message) notifyFailed,
  }) {
    return notifySuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? notifySuccess,
    TResult? Function(String message)? notifyFailed,
  }) {
    return notifySuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notifySuccess,
    TResult Function(String message)? notifyFailed,
    required TResult orElse(),
  }) {
    if (notifySuccess != null) {
      return notifySuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationNotifySuccess value) notifySuccess,
    required TResult Function(_NotificationNotifyFailed value) notifyFailed,
  }) {
    return notifySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult? Function(_NotificationNotifyFailed value)? notifyFailed,
  }) {
    return notifySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult Function(_NotificationNotifyFailed value)? notifyFailed,
    required TResult orElse(),
  }) {
    if (notifySuccess != null) {
      return notifySuccess(this);
    }
    return orElse();
  }
}

abstract class _NotificationNotifySuccess
    implements DogImageRandomNotification {
  factory _NotificationNotifySuccess({required final String message}) =
      _$_NotificationNotifySuccess;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationNotifySuccessCopyWith<_$_NotificationNotifySuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationNotifyFailedCopyWith<$Res>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  factory _$$_NotificationNotifyFailedCopyWith(
          _$_NotificationNotifyFailed value,
          $Res Function(_$_NotificationNotifyFailed) then) =
      __$$_NotificationNotifyFailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NotificationNotifyFailedCopyWithImpl<$Res>
    extends _$DogImageRandomNotificationCopyWithImpl<$Res,
        _$_NotificationNotifyFailed>
    implements _$$_NotificationNotifyFailedCopyWith<$Res> {
  __$$_NotificationNotifyFailedCopyWithImpl(_$_NotificationNotifyFailed _value,
      $Res Function(_$_NotificationNotifyFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NotificationNotifyFailed(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotificationNotifyFailed
    with DiagnosticableTreeMixin
    implements _NotificationNotifyFailed {
  _$_NotificationNotifyFailed({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomNotification.notifyFailed(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DogImageRandomNotification.notifyFailed'))
      ..add(DiagnosticsProperty('message', message));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationNotifyFailedCopyWith<_$_NotificationNotifyFailed>
      get copyWith => __$$_NotificationNotifyFailedCopyWithImpl<
          _$_NotificationNotifyFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notifySuccess,
    required TResult Function(String message) notifyFailed,
  }) {
    return notifyFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? notifySuccess,
    TResult? Function(String message)? notifyFailed,
  }) {
    return notifyFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notifySuccess,
    TResult Function(String message)? notifyFailed,
    required TResult orElse(),
  }) {
    if (notifyFailed != null) {
      return notifyFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationNotifySuccess value) notifySuccess,
    required TResult Function(_NotificationNotifyFailed value) notifyFailed,
  }) {
    return notifyFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult? Function(_NotificationNotifyFailed value)? notifyFailed,
  }) {
    return notifyFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult Function(_NotificationNotifyFailed value)? notifyFailed,
    required TResult orElse(),
  }) {
    if (notifyFailed != null) {
      return notifyFailed(this);
    }
    return orElse();
  }
}

abstract class _NotificationNotifyFailed implements DogImageRandomNotification {
  factory _NotificationNotifyFailed({required final String message}) =
      _$_NotificationNotifyFailed;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationNotifyFailedCopyWith<_$_NotificationNotifyFailed>
      get copyWith => throw _privateConstructorUsedError;
}
