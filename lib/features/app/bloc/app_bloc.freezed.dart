// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function() disableFirstUse,
    required TResult Function() darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function(String locale)? localeChanged,
    TResult? Function()? disableFirstUse,
    TResult? Function()? darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function()? disableFirstUse,
    TResult Function()? darkModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_DisableFirstUse value) disableFirstUse,
    required TResult Function(_DarkModeChanged value) darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_DisableFirstUse value)? disableFirstUse,
    TResult? Function(_DarkModeChanged value)? darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_DisableFirstUse value)? disableFirstUse,
    TResult Function(_DarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

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
    extends _$AppEventCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded();

  @override
  String toString() {
    return 'AppEvent.loaded()';
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
    required TResult Function(String locale) localeChanged,
    required TResult Function() disableFirstUse,
    required TResult Function() darkModeChanged,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function(String locale)? localeChanged,
    TResult? Function()? disableFirstUse,
    TResult? Function()? darkModeChanged,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function()? disableFirstUse,
    TResult Function()? darkModeChanged,
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
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_DisableFirstUse value) disableFirstUse,
    required TResult Function(_DarkModeChanged value) darkModeChanged,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_DisableFirstUse value)? disableFirstUse,
    TResult? Function(_DarkModeChanged value)? darkModeChanged,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_DisableFirstUse value)? disableFirstUse,
    TResult Function(_DarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AppEvent {
  const factory _Loaded() = _$_Loaded;
}

/// @nodoc
abstract class _$$_LocaleChangedCopyWith<$Res> {
  factory _$$_LocaleChangedCopyWith(
          _$_LocaleChanged value, $Res Function(_$_LocaleChanged) then) =
      __$$_LocaleChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$_LocaleChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_LocaleChanged>
    implements _$$_LocaleChangedCopyWith<$Res> {
  __$$_LocaleChangedCopyWithImpl(
      _$_LocaleChanged _value, $Res Function(_$_LocaleChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$_LocaleChanged(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocaleChanged implements _LocaleChanged {
  const _$_LocaleChanged({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'AppEvent.localeChanged(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocaleChanged &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocaleChangedCopyWith<_$_LocaleChanged> get copyWith =>
      __$$_LocaleChangedCopyWithImpl<_$_LocaleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function() disableFirstUse,
    required TResult Function() darkModeChanged,
  }) {
    return localeChanged(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function(String locale)? localeChanged,
    TResult? Function()? disableFirstUse,
    TResult? Function()? darkModeChanged,
  }) {
    return localeChanged?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function()? disableFirstUse,
    TResult Function()? darkModeChanged,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_DisableFirstUse value) disableFirstUse,
    required TResult Function(_DarkModeChanged value) darkModeChanged,
  }) {
    return localeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_DisableFirstUse value)? disableFirstUse,
    TResult? Function(_DarkModeChanged value)? darkModeChanged,
  }) {
    return localeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_DisableFirstUse value)? disableFirstUse,
    TResult Function(_DarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(this);
    }
    return orElse();
  }
}

abstract class _LocaleChanged implements AppEvent {
  const factory _LocaleChanged({required final String locale}) =
      _$_LocaleChanged;

  String get locale;
  @JsonKey(ignore: true)
  _$$_LocaleChangedCopyWith<_$_LocaleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisableFirstUseCopyWith<$Res> {
  factory _$$_DisableFirstUseCopyWith(
          _$_DisableFirstUse value, $Res Function(_$_DisableFirstUse) then) =
      __$$_DisableFirstUseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisableFirstUseCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_DisableFirstUse>
    implements _$$_DisableFirstUseCopyWith<$Res> {
  __$$_DisableFirstUseCopyWithImpl(
      _$_DisableFirstUse _value, $Res Function(_$_DisableFirstUse) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisableFirstUse implements _DisableFirstUse {
  const _$_DisableFirstUse();

  @override
  String toString() {
    return 'AppEvent.disableFirstUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DisableFirstUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function() disableFirstUse,
    required TResult Function() darkModeChanged,
  }) {
    return disableFirstUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function(String locale)? localeChanged,
    TResult? Function()? disableFirstUse,
    TResult? Function()? darkModeChanged,
  }) {
    return disableFirstUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function()? disableFirstUse,
    TResult Function()? darkModeChanged,
    required TResult orElse(),
  }) {
    if (disableFirstUse != null) {
      return disableFirstUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_DisableFirstUse value) disableFirstUse,
    required TResult Function(_DarkModeChanged value) darkModeChanged,
  }) {
    return disableFirstUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_DisableFirstUse value)? disableFirstUse,
    TResult? Function(_DarkModeChanged value)? darkModeChanged,
  }) {
    return disableFirstUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_DisableFirstUse value)? disableFirstUse,
    TResult Function(_DarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (disableFirstUse != null) {
      return disableFirstUse(this);
    }
    return orElse();
  }
}

abstract class _DisableFirstUse implements AppEvent {
  const factory _DisableFirstUse() = _$_DisableFirstUse;
}

/// @nodoc
abstract class _$$_DarkModeChangedCopyWith<$Res> {
  factory _$$_DarkModeChangedCopyWith(
          _$_DarkModeChanged value, $Res Function(_$_DarkModeChanged) then) =
      __$$_DarkModeChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DarkModeChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_DarkModeChanged>
    implements _$$_DarkModeChangedCopyWith<$Res> {
  __$$_DarkModeChangedCopyWithImpl(
      _$_DarkModeChanged _value, $Res Function(_$_DarkModeChanged) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DarkModeChanged implements _DarkModeChanged {
  const _$_DarkModeChanged();

  @override
  String toString() {
    return 'AppEvent.darkModeChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DarkModeChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function() disableFirstUse,
    required TResult Function() darkModeChanged,
  }) {
    return darkModeChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function(String locale)? localeChanged,
    TResult? Function()? disableFirstUse,
    TResult? Function()? darkModeChanged,
  }) {
    return darkModeChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function()? disableFirstUse,
    TResult Function()? darkModeChanged,
    required TResult orElse(),
  }) {
    if (darkModeChanged != null) {
      return darkModeChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_DisableFirstUse value) disableFirstUse,
    required TResult Function(_DarkModeChanged value) darkModeChanged,
  }) {
    return darkModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_DisableFirstUse value)? disableFirstUse,
    TResult? Function(_DarkModeChanged value)? darkModeChanged,
  }) {
    return darkModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_DisableFirstUse value)? disableFirstUse,
    TResult Function(_DarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (darkModeChanged != null) {
      return darkModeChanged(this);
    }
    return orElse();
  }
}

abstract class _DarkModeChanged implements AppEvent {
  const factory _DarkModeChanged() = _$_DarkModeChanged;
}

/// @nodoc
mixin _$AppState {
  UIStatus get status => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isFirstUse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({UIStatus status, String locale, bool isDarkMode, bool isFirstUse});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? locale = null,
    Object? isDarkMode = null,
    Object? isFirstUse = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstUse: null == isFirstUse
          ? _value.isFirstUse
          : isFirstUse // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UIStatus status, String locale, bool isDarkMode, bool isFirstUse});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? locale = null,
    Object? isDarkMode = null,
    Object? isFirstUse = null,
  }) {
    return _then(_$_AppState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstUse: null == isFirstUse
          ? _value.isFirstUse
          : isFirstUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {this.status = const UIInitial(),
      this.locale = AppConfig.defaultLocale,
      this.isDarkMode = false,
      this.isFirstUse = true});

  @override
  @JsonKey()
  final UIStatus status;
  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isFirstUse;

  @override
  String toString() {
    return 'AppState(status: $status, locale: $locale, isDarkMode: $isDarkMode, isFirstUse: $isFirstUse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.isFirstUse, isFirstUse) ||
                other.isFirstUse == isFirstUse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, locale, isDarkMode, isFirstUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final UIStatus status,
      final String locale,
      final bool isDarkMode,
      final bool isFirstUse}) = _$_AppState;

  @override
  UIStatus get status;
  @override
  String get locale;
  @override
  bool get isDarkMode;
  @override
  bool get isFirstUse;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
