// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool enable) darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplicationLoaded value) loaded,
    required TResult Function(ApplicationLocaleChanged value) localeChanged,
    required TResult Function(ApplicationDarkModeChanged value) darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationEventCopyWith<$Res> {
  factory $ApplicationEventCopyWith(
          ApplicationEvent value, $Res Function(ApplicationEvent) then) =
      _$ApplicationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApplicationEventCopyWithImpl<$Res>
    implements $ApplicationEventCopyWith<$Res> {
  _$ApplicationEventCopyWithImpl(this._value, this._then);

  final ApplicationEvent _value;
  // ignore: unused_field
  final $Res Function(ApplicationEvent) _then;
}

/// @nodoc
abstract class _$$ApplicationLoadedCopyWith<$Res> {
  factory _$$ApplicationLoadedCopyWith(
          _$ApplicationLoaded value, $Res Function(_$ApplicationLoaded) then) =
      __$$ApplicationLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ApplicationLoadedCopyWithImpl<$Res>
    extends _$ApplicationEventCopyWithImpl<$Res>
    implements _$$ApplicationLoadedCopyWith<$Res> {
  __$$ApplicationLoadedCopyWithImpl(
      _$ApplicationLoaded _value, $Res Function(_$ApplicationLoaded) _then)
      : super(_value, (v) => _then(v as _$ApplicationLoaded));

  @override
  _$ApplicationLoaded get _value => super._value as _$ApplicationLoaded;
}

/// @nodoc

class _$ApplicationLoaded implements ApplicationLoaded {
  const _$ApplicationLoaded();

  @override
  String toString() {
    return 'ApplicationEvent.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApplicationLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool enable) darkModeChanged,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
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
    required TResult Function(ApplicationLoaded value) loaded,
    required TResult Function(ApplicationLocaleChanged value) localeChanged,
    required TResult Function(ApplicationDarkModeChanged value) darkModeChanged,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ApplicationLoaded implements ApplicationEvent {
  const factory ApplicationLoaded() = _$ApplicationLoaded;
}

/// @nodoc
abstract class _$$ApplicationLocaleChangedCopyWith<$Res> {
  factory _$$ApplicationLocaleChangedCopyWith(_$ApplicationLocaleChanged value,
          $Res Function(_$ApplicationLocaleChanged) then) =
      __$$ApplicationLocaleChangedCopyWithImpl<$Res>;
  $Res call({String locale});
}

/// @nodoc
class __$$ApplicationLocaleChangedCopyWithImpl<$Res>
    extends _$ApplicationEventCopyWithImpl<$Res>
    implements _$$ApplicationLocaleChangedCopyWith<$Res> {
  __$$ApplicationLocaleChangedCopyWithImpl(_$ApplicationLocaleChanged _value,
      $Res Function(_$ApplicationLocaleChanged) _then)
      : super(_value, (v) => _then(v as _$ApplicationLocaleChanged));

  @override
  _$ApplicationLocaleChanged get _value =>
      super._value as _$ApplicationLocaleChanged;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$ApplicationLocaleChanged(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApplicationLocaleChanged implements ApplicationLocaleChanged {
  const _$ApplicationLocaleChanged({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'ApplicationEvent.localeChanged(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationLocaleChanged &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locale));

  @JsonKey(ignore: true)
  @override
  _$$ApplicationLocaleChangedCopyWith<_$ApplicationLocaleChanged>
      get copyWith =>
          __$$ApplicationLocaleChangedCopyWithImpl<_$ApplicationLocaleChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool enable) darkModeChanged,
  }) {
    return localeChanged(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
  }) {
    return localeChanged?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
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
    required TResult Function(ApplicationLoaded value) loaded,
    required TResult Function(ApplicationLocaleChanged value) localeChanged,
    required TResult Function(ApplicationDarkModeChanged value) darkModeChanged,
  }) {
    return localeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
  }) {
    return localeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(this);
    }
    return orElse();
  }
}

abstract class ApplicationLocaleChanged implements ApplicationEvent {
  const factory ApplicationLocaleChanged({required final String locale}) =
      _$ApplicationLocaleChanged;

  String get locale;
  @JsonKey(ignore: true)
  _$$ApplicationLocaleChangedCopyWith<_$ApplicationLocaleChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationDarkModeChangedCopyWith<$Res> {
  factory _$$ApplicationDarkModeChangedCopyWith(
          _$ApplicationDarkModeChanged value,
          $Res Function(_$ApplicationDarkModeChanged) then) =
      __$$ApplicationDarkModeChangedCopyWithImpl<$Res>;
  $Res call({bool enable});
}

/// @nodoc
class __$$ApplicationDarkModeChangedCopyWithImpl<$Res>
    extends _$ApplicationEventCopyWithImpl<$Res>
    implements _$$ApplicationDarkModeChangedCopyWith<$Res> {
  __$$ApplicationDarkModeChangedCopyWithImpl(
      _$ApplicationDarkModeChanged _value,
      $Res Function(_$ApplicationDarkModeChanged) _then)
      : super(_value, (v) => _then(v as _$ApplicationDarkModeChanged));

  @override
  _$ApplicationDarkModeChanged get _value =>
      super._value as _$ApplicationDarkModeChanged;

  @override
  $Res call({
    Object? enable = freezed,
  }) {
    return _then(_$ApplicationDarkModeChanged(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ApplicationDarkModeChanged implements ApplicationDarkModeChanged {
  const _$ApplicationDarkModeChanged({required this.enable});

  @override
  final bool enable;

  @override
  String toString() {
    return 'ApplicationEvent.darkModeChanged(enable: $enable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDarkModeChanged &&
            const DeepCollectionEquality().equals(other.enable, enable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(enable));

  @JsonKey(ignore: true)
  @override
  _$$ApplicationDarkModeChangedCopyWith<_$ApplicationDarkModeChanged>
      get copyWith => __$$ApplicationDarkModeChangedCopyWithImpl<
          _$ApplicationDarkModeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool enable) darkModeChanged,
  }) {
    return darkModeChanged(enable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
  }) {
    return darkModeChanged?.call(enable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool enable)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (darkModeChanged != null) {
      return darkModeChanged(enable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplicationLoaded value) loaded,
    required TResult Function(ApplicationLocaleChanged value) localeChanged,
    required TResult Function(ApplicationDarkModeChanged value) darkModeChanged,
  }) {
    return darkModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
  }) {
    return darkModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationLoaded value)? loaded,
    TResult Function(ApplicationLocaleChanged value)? localeChanged,
    TResult Function(ApplicationDarkModeChanged value)? darkModeChanged,
    required TResult orElse(),
  }) {
    if (darkModeChanged != null) {
      return darkModeChanged(this);
    }
    return orElse();
  }
}

abstract class ApplicationDarkModeChanged implements ApplicationEvent {
  const factory ApplicationDarkModeChanged({required final bool enable}) =
      _$ApplicationDarkModeChanged;

  bool get enable;
  @JsonKey(ignore: true)
  _$$ApplicationDarkModeChangedCopyWith<_$ApplicationDarkModeChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApplicationState {
  UIStatus get status => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationStateCopyWith<ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res>;
  $Res call({UIStatus status, String locale, bool isDarkMode});
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  final ApplicationState _value;
  // ignore: unused_field
  final $Res Function(ApplicationState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? locale = freezed,
    Object? isDarkMode = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ApplicationStateCopyWith<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  factory _$$_ApplicationStateCopyWith(
          _$_ApplicationState value, $Res Function(_$_ApplicationState) then) =
      __$$_ApplicationStateCopyWithImpl<$Res>;
  @override
  $Res call({UIStatus status, String locale, bool isDarkMode});
}

/// @nodoc
class __$$_ApplicationStateCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res>
    implements _$$_ApplicationStateCopyWith<$Res> {
  __$$_ApplicationStateCopyWithImpl(
      _$_ApplicationState _value, $Res Function(_$_ApplicationState) _then)
      : super(_value, (v) => _then(v as _$_ApplicationState));

  @override
  _$_ApplicationState get _value => super._value as _$_ApplicationState;

  @override
  $Res call({
    Object? status = freezed,
    Object? locale = freezed,
    Object? isDarkMode = freezed,
  }) {
    return _then(_$_ApplicationState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ApplicationState implements _ApplicationState {
  const _$_ApplicationState(
      {this.status = UIStatus.loading,
      this.locale = 'en',
      this.isDarkMode = false});

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
  String toString() {
    return 'ApplicationState(status: $status, locale: $locale, isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            const DeepCollectionEquality()
                .equals(other.isDarkMode, isDarkMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(locale),
      const DeepCollectionEquality().hash(isDarkMode));

  @JsonKey(ignore: true)
  @override
  _$$_ApplicationStateCopyWith<_$_ApplicationState> get copyWith =>
      __$$_ApplicationStateCopyWithImpl<_$_ApplicationState>(this, _$identity);
}

abstract class _ApplicationState implements ApplicationState {
  const factory _ApplicationState(
      {final UIStatus status,
      final String locale,
      final bool isDarkMode}) = _$_ApplicationState;

  @override
  UIStatus get status;
  @override
  String get locale;
  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationStateCopyWith<_$_ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}
