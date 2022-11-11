// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flavor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlavorModel _$FlavorModelFromJson(Map<String, dynamic> json) {
  return _FlavorModel.fromJson(json);
}

/// @nodoc
mixin _$FlavorModel {
  String get flavor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlavorModelCopyWith<FlavorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorModelCopyWith<$Res> {
  factory $FlavorModelCopyWith(
          FlavorModel value, $Res Function(FlavorModel) then) =
      _$FlavorModelCopyWithImpl<$Res, FlavorModel>;
  @useResult
  $Res call({String flavor});
}

/// @nodoc
class _$FlavorModelCopyWithImpl<$Res, $Val extends FlavorModel>
    implements $FlavorModelCopyWith<$Res> {
  _$FlavorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavor = null,
  }) {
    return _then(_value.copyWith(
      flavor: null == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlavorModelCopyWith<$Res>
    implements $FlavorModelCopyWith<$Res> {
  factory _$$_FlavorModelCopyWith(
          _$_FlavorModel value, $Res Function(_$_FlavorModel) then) =
      __$$_FlavorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flavor});
}

/// @nodoc
class __$$_FlavorModelCopyWithImpl<$Res>
    extends _$FlavorModelCopyWithImpl<$Res, _$_FlavorModel>
    implements _$$_FlavorModelCopyWith<$Res> {
  __$$_FlavorModelCopyWithImpl(
      _$_FlavorModel _value, $Res Function(_$_FlavorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavor = null,
  }) {
    return _then(_$_FlavorModel(
      flavor: null == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlavorModel implements _FlavorModel {
  const _$_FlavorModel({required this.flavor});

  factory _$_FlavorModel.fromJson(Map<String, dynamic> json) =>
      _$$_FlavorModelFromJson(json);

  @override
  final String flavor;

  @override
  String toString() {
    return 'FlavorModel(flavor: $flavor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlavorModel &&
            (identical(other.flavor, flavor) || other.flavor == flavor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flavor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlavorModelCopyWith<_$_FlavorModel> get copyWith =>
      __$$_FlavorModelCopyWithImpl<_$_FlavorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlavorModelToJson(
      this,
    );
  }
}

abstract class _FlavorModel implements FlavorModel {
  const factory _FlavorModel({required final String flavor}) = _$_FlavorModel;

  factory _FlavorModel.fromJson(Map<String, dynamic> json) =
      _$_FlavorModel.fromJson;

  @override
  String get flavor;
  @override
  @JsonKey(ignore: true)
  _$$_FlavorModelCopyWith<_$_FlavorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
