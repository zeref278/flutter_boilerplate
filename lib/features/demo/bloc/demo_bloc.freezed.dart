// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DemoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DemoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DemoEvent()';
  }
}

/// @nodoc
class $DemoEventCopyWith<$Res> {
  $DemoEventCopyWith(DemoEvent _, $Res Function(DemoEvent) __);
}

/// Adds pattern-matching-related methods to [DemoEvent].
extension DemoEventPatterns on DemoEvent {
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
    TResult Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult Function(_DeleteImageFromDB value)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB() when loadImageFromDB != null:
        return loadImageFromDB(_that);
      case _DeleteImageFromDB() when deleteImageFromDB != null:
        return deleteImageFromDB(_that);
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
    required TResult Function(_LoadImageFromDB value) loadImageFromDB,
    required TResult Function(_DeleteImageFromDB value) deleteImageFromDB,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB():
        return loadImageFromDB(_that);
      case _DeleteImageFromDB():
        return deleteImageFromDB(_that);
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
    TResult? Function(_LoadImageFromDB value)? loadImageFromDB,
    TResult? Function(_DeleteImageFromDB value)? deleteImageFromDB,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB() when loadImageFromDB != null:
        return loadImageFromDB(_that);
      case _DeleteImageFromDB() when deleteImageFromDB != null:
        return deleteImageFromDB(_that);
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
    TResult Function()? loadImageFromDB,
    TResult Function(DogImage dogImage)? deleteImageFromDB,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB() when loadImageFromDB != null:
        return loadImageFromDB();
      case _DeleteImageFromDB() when deleteImageFromDB != null:
        return deleteImageFromDB(_that.dogImage);
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
    required TResult Function() loadImageFromDB,
    required TResult Function(DogImage dogImage) deleteImageFromDB,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB():
        return loadImageFromDB();
      case _DeleteImageFromDB():
        return deleteImageFromDB(_that.dogImage);
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
    TResult? Function()? loadImageFromDB,
    TResult? Function(DogImage dogImage)? deleteImageFromDB,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadImageFromDB() when loadImageFromDB != null:
        return loadImageFromDB();
      case _DeleteImageFromDB() when deleteImageFromDB != null:
        return deleteImageFromDB(_that.dogImage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadImageFromDB implements DemoEvent {
  const _LoadImageFromDB();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadImageFromDB);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DemoEvent.loadImageFromDB()';
  }
}

/// @nodoc

class _DeleteImageFromDB implements DemoEvent {
  const _DeleteImageFromDB({required this.dogImage});

  final DogImage dogImage;

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteImageFromDBCopyWith<_DeleteImageFromDB> get copyWith =>
      __$DeleteImageFromDBCopyWithImpl<_DeleteImageFromDB>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteImageFromDB &&
            (identical(other.dogImage, dogImage) ||
                other.dogImage == dogImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dogImage);

  @override
  String toString() {
    return 'DemoEvent.deleteImageFromDB(dogImage: $dogImage)';
  }
}

/// @nodoc
abstract mixin class _$DeleteImageFromDBCopyWith<$Res>
    implements $DemoEventCopyWith<$Res> {
  factory _$DeleteImageFromDBCopyWith(
          _DeleteImageFromDB value, $Res Function(_DeleteImageFromDB) _then) =
      __$DeleteImageFromDBCopyWithImpl;
  @useResult
  $Res call({DogImage dogImage});

  $DogImageCopyWith<$Res> get dogImage;
}

/// @nodoc
class __$DeleteImageFromDBCopyWithImpl<$Res>
    implements _$DeleteImageFromDBCopyWith<$Res> {
  __$DeleteImageFromDBCopyWithImpl(this._self, this._then);

  final _DeleteImageFromDB _self;
  final $Res Function(_DeleteImageFromDB) _then;

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dogImage = null,
  }) {
    return _then(_DeleteImageFromDB(
      dogImage: null == dogImage
          ? _self.dogImage
          : dogImage // ignore: cast_nullable_to_non_nullable
              as DogImage,
    ));
  }

  /// Create a copy of DemoEvent
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
mixin _$DemoState {
  UIStatus get status;
  DemoNotification? get notification;
  List<DogImage> get images;
  bool get isBusy;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DemoStateCopyWith<DemoState> get copyWith =>
      _$DemoStateCopyWithImpl<DemoState>(this as DemoState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DemoState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, notification,
      const DeepCollectionEquality().hash(images), isBusy);

  @override
  String toString() {
    return 'DemoState(status: $status, notification: $notification, images: $images, isBusy: $isBusy)';
  }
}

/// @nodoc
abstract mixin class $DemoStateCopyWith<$Res> {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) _then) =
      _$DemoStateCopyWithImpl;
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
class _$DemoStateCopyWithImpl<$Res> implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._self, this._then);

  final DemoState _self;
  final $Res Function(DemoState) _then;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? images = null,
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
              as DemoNotification?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      isBusy: null == isBusy
          ? _self.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DemoNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $DemoNotificationCopyWith<$Res>(_self.notification!, (value) {
      return _then(_self.copyWith(notification: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DemoState].
extension DemoStatePatterns on DemoState {
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
    TResult Function(_DemoState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DemoState() when $default != null:
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
    TResult Function(_DemoState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DemoState():
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
    TResult? Function(_DemoState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DemoState() when $default != null:
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
    TResult Function(UIStatus status, DemoNotification? notification,
            List<DogImage> images, bool isBusy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DemoState() when $default != null:
        return $default(
            _that.status, _that.notification, _that.images, _that.isBusy);
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
    TResult Function(UIStatus status, DemoNotification? notification,
            List<DogImage> images, bool isBusy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DemoState():
        return $default(
            _that.status, _that.notification, _that.images, _that.isBusy);
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
    TResult? Function(UIStatus status, DemoNotification? notification,
            List<DogImage> images, bool isBusy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DemoState() when $default != null:
        return $default(
            _that.status, _that.notification, _that.images, _that.isBusy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DemoState implements DemoState {
  const _DemoState(
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

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DemoStateCopyWith<_DemoState> get copyWith =>
      __$DemoStateCopyWithImpl<_DemoState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DemoState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, notification,
      const DeepCollectionEquality().hash(_images), isBusy);

  @override
  String toString() {
    return 'DemoState(status: $status, notification: $notification, images: $images, isBusy: $isBusy)';
  }
}

/// @nodoc
abstract mixin class _$DemoStateCopyWith<$Res>
    implements $DemoStateCopyWith<$Res> {
  factory _$DemoStateCopyWith(
          _DemoState value, $Res Function(_DemoState) _then) =
      __$DemoStateCopyWithImpl;
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
class __$DemoStateCopyWithImpl<$Res> implements _$DemoStateCopyWith<$Res> {
  __$DemoStateCopyWithImpl(this._self, this._then);

  final _DemoState _self;
  final $Res Function(_DemoState) _then;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? notification = freezed,
    Object? images = null,
    Object? isBusy = null,
  }) {
    return _then(_DemoState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as DemoNotification?,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DogImage>,
      isBusy: null == isBusy
          ? _self.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DemoNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
      return null;
    }

    return $DemoNotificationCopyWith<$Res>(_self.notification!, (value) {
      return _then(_self.copyWith(notification: value));
    });
  }
}

/// @nodoc
mixin _$DemoNotification {
  String get message;

  /// Create a copy of DemoNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DemoNotificationCopyWith<DemoNotification> get copyWith =>
      _$DemoNotificationCopyWithImpl<DemoNotification>(
          this as DemoNotification, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DemoNotification &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DemoNotification(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DemoNotificationCopyWith<$Res> {
  factory $DemoNotificationCopyWith(
          DemoNotification value, $Res Function(DemoNotification) _then) =
      _$DemoNotificationCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DemoNotificationCopyWithImpl<$Res>
    implements $DemoNotificationCopyWith<$Res> {
  _$DemoNotificationCopyWithImpl(this._self, this._then);

  final DemoNotification _self;
  final $Res Function(DemoNotification) _then;

  /// Create a copy of DemoNotification
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

/// Adds pattern-matching-related methods to [DemoNotification].
extension DemoNotificationPatterns on DemoNotification {
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
    TResult Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult Function(_NotificationInsertFailed value)? insertFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess() when insertSuccess != null:
        return insertSuccess(_that);
      case _NotificationInsertFailed() when insertFailed != null:
        return insertFailed(_that);
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
    required TResult Function(_NotificationInsertSuccess value) insertSuccess,
    required TResult Function(_NotificationInsertFailed value) insertFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess():
        return insertSuccess(_that);
      case _NotificationInsertFailed():
        return insertFailed(_that);
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
    TResult? Function(_NotificationInsertSuccess value)? insertSuccess,
    TResult? Function(_NotificationInsertFailed value)? insertFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess() when insertSuccess != null:
        return insertSuccess(_that);
      case _NotificationInsertFailed() when insertFailed != null:
        return insertFailed(_that);
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
    TResult Function(String message)? insertSuccess,
    TResult Function(String message)? insertFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess() when insertSuccess != null:
        return insertSuccess(_that.message);
      case _NotificationInsertFailed() when insertFailed != null:
        return insertFailed(_that.message);
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
    required TResult Function(String message) insertSuccess,
    required TResult Function(String message) insertFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess():
        return insertSuccess(_that.message);
      case _NotificationInsertFailed():
        return insertFailed(_that.message);
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
    TResult? Function(String message)? insertSuccess,
    TResult? Function(String message)? insertFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationInsertSuccess() when insertSuccess != null:
        return insertSuccess(_that.message);
      case _NotificationInsertFailed() when insertFailed != null:
        return insertFailed(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationInsertSuccess implements DemoNotification {
  const _NotificationInsertSuccess({required this.message});

  @override
  final String message;

  /// Create a copy of DemoNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationInsertSuccessCopyWith<_NotificationInsertSuccess>
      get copyWith =>
          __$NotificationInsertSuccessCopyWithImpl<_NotificationInsertSuccess>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationInsertSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DemoNotification.insertSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NotificationInsertSuccessCopyWith<$Res>
    implements $DemoNotificationCopyWith<$Res> {
  factory _$NotificationInsertSuccessCopyWith(_NotificationInsertSuccess value,
          $Res Function(_NotificationInsertSuccess) _then) =
      __$NotificationInsertSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$NotificationInsertSuccessCopyWithImpl<$Res>
    implements _$NotificationInsertSuccessCopyWith<$Res> {
  __$NotificationInsertSuccessCopyWithImpl(this._self, this._then);

  final _NotificationInsertSuccess _self;
  final $Res Function(_NotificationInsertSuccess) _then;

  /// Create a copy of DemoNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_NotificationInsertSuccess(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _NotificationInsertFailed implements DemoNotification {
  const _NotificationInsertFailed({required this.message});

  @override
  final String message;

  /// Create a copy of DemoNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationInsertFailedCopyWith<_NotificationInsertFailed> get copyWith =>
      __$NotificationInsertFailedCopyWithImpl<_NotificationInsertFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationInsertFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DemoNotification.insertFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NotificationInsertFailedCopyWith<$Res>
    implements $DemoNotificationCopyWith<$Res> {
  factory _$NotificationInsertFailedCopyWith(_NotificationInsertFailed value,
          $Res Function(_NotificationInsertFailed) _then) =
      __$NotificationInsertFailedCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$NotificationInsertFailedCopyWithImpl<$Res>
    implements _$NotificationInsertFailedCopyWith<$Res> {
  __$NotificationInsertFailedCopyWithImpl(this._self, this._then);

  final _NotificationInsertFailed _self;
  final $Res Function(_NotificationInsertFailed) _then;

  /// Create a copy of DemoNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_NotificationInsertFailed(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
