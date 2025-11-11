// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog_image_random_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DogImageRandomEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DogImageRandomEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DogImageRandomEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomEvent()';
  }
}

/// @nodoc
class $DogImageRandomEventCopyWith<$Res> {
  $DogImageRandomEventCopyWith(
      DogImageRandomEvent _, $Res Function(DogImageRandomEvent) __);
}

/// Adds pattern-matching-related methods to [DogImageRandomEvent].
extension DogImageRandomEventPatterns on DogImageRandomEvent {
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RandomRequested value)? randomRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _RandomRequested() when randomRequested != null:
        return randomRequested(_that);
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RandomRequested value) randomRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded():
        return loaded(_that);
      case _RandomRequested():
        return randomRequested(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RandomRequested value)? randomRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _RandomRequested() when randomRequested != null:
        return randomRequested(_that);
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
    TResult Function()? loaded,
    TResult Function(bool insertDb)? randomRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded() when loaded != null:
        return loaded();
      case _RandomRequested() when randomRequested != null:
        return randomRequested(_that.insertDb);
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
    required TResult Function() loaded,
    required TResult Function(bool insertDb) randomRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded():
        return loaded();
      case _RandomRequested():
        return randomRequested(_that.insertDb);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function()? loaded,
    TResult? Function(bool insertDb)? randomRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Loaded() when loaded != null:
        return loaded();
      case _RandomRequested() when randomRequested != null:
        return randomRequested(_that.insertDb);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements DogImageRandomEvent {
  const _Loaded();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DogImageRandomEvent.loaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomEvent.loaded()';
  }
}

/// @nodoc

class _RandomRequested
    with DiagnosticableTreeMixin
    implements DogImageRandomEvent {
  const _RandomRequested({this.insertDb = false});

  @JsonKey()
  final bool insertDb;

  /// Create a copy of DogImageRandomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RandomRequestedCopyWith<_RandomRequested> get copyWith =>
      __$RandomRequestedCopyWithImpl<_RandomRequested>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomEvent.randomRequested'))
      ..add(DiagnosticsProperty('insertDb', insertDb));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RandomRequested &&
            (identical(other.insertDb, insertDb) ||
                other.insertDb == insertDb));
  }

  @override
  int get hashCode => Object.hash(runtimeType, insertDb);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomEvent.randomRequested(insertDb: $insertDb)';
  }
}

/// @nodoc
abstract mixin class _$RandomRequestedCopyWith<$Res>
    implements $DogImageRandomEventCopyWith<$Res> {
  factory _$RandomRequestedCopyWith(
          _RandomRequested value, $Res Function(_RandomRequested) _then) =
      __$RandomRequestedCopyWithImpl;
  @useResult
  $Res call({bool insertDb});
}

/// @nodoc
class __$RandomRequestedCopyWithImpl<$Res>
    implements _$RandomRequestedCopyWith<$Res> {
  __$RandomRequestedCopyWithImpl(this._self, this._then);

  final _RandomRequested _self;
  final $Res Function(_RandomRequested) _then;

  /// Create a copy of DogImageRandomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? insertDb = null,
  }) {
    return _then(_RandomRequested(
      insertDb: null == insertDb
          ? _self.insertDb
          : insertDb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$DogImageRandomState implements DiagnosticableTreeMixin {
  UIStatus get status;
  DogImageRandomNotification? get notification;
  DogImage get dogImage;
  bool get isBusy;

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DogImageRandomStateCopyWith<DogImageRandomState> get copyWith =>
      _$DogImageRandomStateCopyWithImpl<DogImageRandomState>(
          this as DogImageRandomState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('notification', notification))
      ..add(DiagnosticsProperty('dogImage', dogImage))
      ..add(DiagnosticsProperty('isBusy', isBusy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DogImageRandomState &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomState(status: $status, notification: $notification, dogImage: $dogImage, isBusy: $isBusy)';
  }
}

/// @nodoc
abstract mixin class $DogImageRandomStateCopyWith<$Res> {
  factory $DogImageRandomStateCopyWith(
          DogImageRandomState value, $Res Function(DogImageRandomState) _then) =
      _$DogImageRandomStateCopyWithImpl;
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
class _$DogImageRandomStateCopyWithImpl<$Res>
    implements $DogImageRandomStateCopyWith<$Res> {
  _$DogImageRandomStateCopyWithImpl(this._self, this._then);

  final DogImageRandomState _self;
  final $Res Function(DogImageRandomState) _then;

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? dogImage = null,
    Object? isBusy = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DogImageRandomNotification?,
      dogImage: null == dogImage
          ? _self.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
      isBusy: null == isBusy
          ? _self.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DogImageRandomNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $DogImageRandomNotificationCopyWith<$Res>(_self.notification!,
        (value) {
      return _then(_self.copyWith(notification: value));
    });
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DogImageCopyWith<$Res> get dogImage {
    return $DogImageCopyWith<$Res>(_self.dogImage, (value) {
      return _then(_self.copyWith(dogImage: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DogImageRandomState].
extension DogImageRandomStatePatterns on DogImageRandomState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DogImageRandomState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_DogImageRandomState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DogImageRandomState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UIStatus status, DogImageRandomNotification? notification,
            DogImage dogImage, bool isBusy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState() when $default != null:
        return $default(
            _that.status, _that.notification, _that.dogImage, _that.isBusy);
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
  TResult when<TResult extends Object?>(
    TResult Function(UIStatus status, DogImageRandomNotification? notification,
            DogImage dogImage, bool isBusy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState():
        return $default(
            _that.status, _that.notification, _that.dogImage, _that.isBusy);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(UIStatus status, DogImageRandomNotification? notification,
            DogImage dogImage, bool isBusy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DogImageRandomState() when $default != null:
        return $default(
            _that.status, _that.notification, _that.dogImage, _that.isBusy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DogImageRandomState
    with DiagnosticableTreeMixin
    implements DogImageRandomState {
  const _DogImageRandomState(
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

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DogImageRandomStateCopyWith<_DogImageRandomState> get copyWith =>
      __$DogImageRandomStateCopyWithImpl<_DogImageRandomState>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('notification', notification))
      ..add(DiagnosticsProperty('dogImage', dogImage))
      ..add(DiagnosticsProperty('isBusy', isBusy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DogImageRandomState &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomState(status: $status, notification: $notification, dogImage: $dogImage, isBusy: $isBusy)';
  }
}

/// @nodoc
abstract mixin class _$DogImageRandomStateCopyWith<$Res>
    implements $DogImageRandomStateCopyWith<$Res> {
  factory _$DogImageRandomStateCopyWith(_DogImageRandomState value,
          $Res Function(_DogImageRandomState) _then) =
      __$DogImageRandomStateCopyWithImpl;
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
class __$DogImageRandomStateCopyWithImpl<$Res>
    implements _$DogImageRandomStateCopyWith<$Res> {
  __$DogImageRandomStateCopyWithImpl(this._self, this._then);

  final _DogImageRandomState _self;
  final $Res Function(_DogImageRandomState) _then;

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? dogImage = null,
    Object? isBusy = null,
  }) {
    return _then(_DogImageRandomState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DogImageRandomNotification?,
      dogImage: null == dogImage
          ? _self.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
      isBusy: null == isBusy
          ? _self.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DogImageRandomNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $DogImageRandomNotificationCopyWith<$Res>(_self.notification!,
        (value) {
      return _then(_self.copyWith(notification: value));
    });
  }

  /// Create a copy of DogImageRandomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DogImageCopyWith<$Res> get dogImage {
    return $DogImageCopyWith<$Res>(_self.dogImage, (value) {
      return _then(_self.copyWith(dogImage: value));
    });
  }
}

/// @nodoc
mixin _$DogImageRandomNotification implements DiagnosticableTreeMixin {
  String get message;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DogImageRandomNotificationCopyWith<DogImageRandomNotification>
      get copyWith =>
          _$DogImageRandomNotificationCopyWithImpl<DogImageRandomNotification>(
              this as DogImageRandomNotification, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DogImageRandomNotification'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DogImageRandomNotification &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomNotification(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DogImageRandomNotificationCopyWith<$Res> {
  factory $DogImageRandomNotificationCopyWith(DogImageRandomNotification value,
          $Res Function(DogImageRandomNotification) _then) =
      _$DogImageRandomNotificationCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DogImageRandomNotificationCopyWithImpl<$Res>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  _$DogImageRandomNotificationCopyWithImpl(this._self, this._then);

  final DogImageRandomNotification _self;
  final $Res Function(DogImageRandomNotification) _then;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DogImageRandomNotification].
extension DogImageRandomNotificationPatterns on DogImageRandomNotification {
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
    TResult Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult Function(_NotificationNotifyFailed value)? notifyFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess() when notifySuccess != null:
        return notifySuccess(_that);
      case _NotificationNotifyFailed() when notifyFailed != null:
        return notifyFailed(_that);
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
    required TResult Function(_NotificationNotifySuccess value) notifySuccess,
    required TResult Function(_NotificationNotifyFailed value) notifyFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess():
        return notifySuccess(_that);
      case _NotificationNotifyFailed():
        return notifyFailed(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_NotificationNotifySuccess value)? notifySuccess,
    TResult? Function(_NotificationNotifyFailed value)? notifyFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess() when notifySuccess != null:
        return notifySuccess(_that);
      case _NotificationNotifyFailed() when notifyFailed != null:
        return notifyFailed(_that);
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
    TResult Function(String message)? notifySuccess,
    TResult Function(String message)? notifyFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess() when notifySuccess != null:
        return notifySuccess(_that.message);
      case _NotificationNotifyFailed() when notifyFailed != null:
        return notifyFailed(_that.message);
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
    required TResult Function(String message) notifySuccess,
    required TResult Function(String message) notifyFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess():
        return notifySuccess(_that.message);
      case _NotificationNotifyFailed():
        return notifyFailed(_that.message);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(String message)? notifySuccess,
    TResult? Function(String message)? notifyFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationNotifySuccess() when notifySuccess != null:
        return notifySuccess(_that.message);
      case _NotificationNotifyFailed() when notifyFailed != null:
        return notifyFailed(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationNotifySuccess
    with DiagnosticableTreeMixin
    implements DogImageRandomNotification {
  const _NotificationNotifySuccess({required this.message});

  @override
  final String message;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationNotifySuccessCopyWith<_NotificationNotifySuccess>
      get copyWith =>
          __$NotificationNotifySuccessCopyWithImpl<_NotificationNotifySuccess>(
              this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'DogImageRandomNotification.notifySuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationNotifySuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomNotification.notifySuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NotificationNotifySuccessCopyWith<$Res>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  factory _$NotificationNotifySuccessCopyWith(_NotificationNotifySuccess value,
          $Res Function(_NotificationNotifySuccess) _then) =
      __$NotificationNotifySuccessCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$NotificationNotifySuccessCopyWithImpl<$Res>
    implements _$NotificationNotifySuccessCopyWith<$Res> {
  __$NotificationNotifySuccessCopyWithImpl(this._self, this._then);

  final _NotificationNotifySuccess _self;
  final $Res Function(_NotificationNotifySuccess) _then;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_NotificationNotifySuccess(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _NotificationNotifyFailed
    with DiagnosticableTreeMixin
    implements DogImageRandomNotification {
  const _NotificationNotifyFailed({required this.message});

  @override
  final String message;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationNotifyFailedCopyWith<_NotificationNotifyFailed> get copyWith =>
      __$NotificationNotifyFailedCopyWithImpl<_NotificationNotifyFailed>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'DogImageRandomNotification.notifyFailed'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationNotifyFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogImageRandomNotification.notifyFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NotificationNotifyFailedCopyWith<$Res>
    implements $DogImageRandomNotificationCopyWith<$Res> {
  factory _$NotificationNotifyFailedCopyWith(_NotificationNotifyFailed value,
          $Res Function(_NotificationNotifyFailed) _then) =
      __$NotificationNotifyFailedCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$NotificationNotifyFailedCopyWithImpl<$Res>
    implements _$NotificationNotifyFailedCopyWith<$Res> {
  __$NotificationNotifyFailedCopyWithImpl(this._self, this._then);

  final _NotificationNotifyFailed _self;
  final $Res Function(_NotificationNotifyFailed) _then;

  /// Create a copy of DogImageRandomNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_NotificationNotifyFailed(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
