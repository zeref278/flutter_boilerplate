// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dog_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DogImage _$DogImageFromJson(Map<String, dynamic> json) {
  return _DogImage.fromJson(json);
}

/// @nodoc
mixin _$DogImage {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogImageCopyWith<DogImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImageCopyWith<$Res> {
  factory $DogImageCopyWith(DogImage value, $Res Function(DogImage) then) =
      _$DogImageCopyWithImpl<$Res>;
  $Res call({String message, String status});
}

/// @nodoc
class _$DogImageCopyWithImpl<$Res> implements $DogImageCopyWith<$Res> {
  _$DogImageCopyWithImpl(this._value, this._then);

  final DogImage _value;
  // ignore: unused_field
  final $Res Function(DogImage) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DogImageCopyWith<$Res> implements $DogImageCopyWith<$Res> {
  factory _$$_DogImageCopyWith(
          _$_DogImage value, $Res Function(_$_DogImage) then) =
      __$$_DogImageCopyWithImpl<$Res>;
  @override
  $Res call({String message, String status});
}

/// @nodoc
class __$$_DogImageCopyWithImpl<$Res> extends _$DogImageCopyWithImpl<$Res>
    implements _$$_DogImageCopyWith<$Res> {
  __$$_DogImageCopyWithImpl(
      _$_DogImage _value, $Res Function(_$_DogImage) _then)
      : super(_value, (v) => _then(v as _$_DogImage));

  @override
  _$_DogImage get _value => super._value as _$_DogImage;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_DogImage(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DogImage implements _DogImage {
  const _$_DogImage({required this.message, required this.status});

  factory _$_DogImage.fromJson(Map<String, dynamic> json) =>
      _$$_DogImageFromJson(json);

  @override
  final String message;
  @override
  final String status;

  @override
  String toString() {
    return 'DogImage(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DogImage &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_DogImageCopyWith<_$_DogImage> get copyWith =>
      __$$_DogImageCopyWithImpl<_$_DogImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DogImageToJson(
      this,
    );
  }
}

abstract class _DogImage implements DogImage {
  const factory _DogImage(
      {required final String message,
      required final String status}) = _$_DogImage;

  factory _DogImage.fromJson(Map<String, dynamic> json) = _$_DogImage.fromJson;

  @override
  String get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_DogImageCopyWith<_$_DogImage> get copyWith =>
      throw _privateConstructorUsedError;
}
