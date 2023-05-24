// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Paging<T> _$PagingFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Paging<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Paging<T> {
  List<T> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCount')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentCount')
  int? get currentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagingCopyWith<T, Paging<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingCopyWith<T, $Res> {
  factory $PagingCopyWith(Paging<T> value, $Res Function(Paging<T>) then) =
      _$PagingCopyWithImpl<T, $Res, Paging<T>>;
  @useResult
  $Res call(
      {List<T> items,
      @JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'currentCount') int? currentCount});
}

/// @nodoc
class _$PagingCopyWithImpl<T, $Res, $Val extends Paging<T>>
    implements $PagingCopyWith<T, $Res> {
  _$PagingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? currentCount = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentCount: freezed == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagingCopyWith<T, $Res> implements $PagingCopyWith<T, $Res> {
  factory _$$_PagingCopyWith(
          _$_Paging<T> value, $Res Function(_$_Paging<T>) then) =
      __$$_PagingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> items,
      @JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'currentCount') int? currentCount});
}

/// @nodoc
class __$$_PagingCopyWithImpl<T, $Res>
    extends _$PagingCopyWithImpl<T, $Res, _$_Paging<T>>
    implements _$$_PagingCopyWith<T, $Res> {
  __$$_PagingCopyWithImpl(
      _$_Paging<T> _value, $Res Function(_$_Paging<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? currentCount = freezed,
  }) {
    return _then(_$_Paging<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentCount: freezed == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Paging<T> implements _Paging<T> {
  const _$_Paging(
      {required final List<T> items,
      @JsonKey(name: 'totalCount') this.totalCount,
      @JsonKey(name: 'currentCount') this.currentCount})
      : _items = items;

  factory _$_Paging.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PagingFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @override
  @JsonKey(name: 'currentCount')
  final int? currentCount;

  @override
  String toString() {
    return 'Paging<$T>(items: $items, totalCount: $totalCount, currentCount: $currentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Paging<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), totalCount, currentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagingCopyWith<T, _$_Paging<T>> get copyWith =>
      __$$_PagingCopyWithImpl<T, _$_Paging<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PagingToJson<T>(this, toJsonT);
  }
}

abstract class _Paging<T> implements Paging<T> {
  const factory _Paging(
      {required final List<T> items,
      @JsonKey(name: 'totalCount') final int? totalCount,
      @JsonKey(name: 'currentCount') final int? currentCount}) = _$_Paging<T>;

  factory _Paging.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_Paging<T>.fromJson;

  @override
  List<T> get items;
  @override
  @JsonKey(name: 'totalCount')
  int? get totalCount;
  @override
  @JsonKey(name: 'currentCount')
  int? get currentCount;
  @override
  @JsonKey(ignore: true)
  _$$_PagingCopyWith<T, _$_Paging<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
