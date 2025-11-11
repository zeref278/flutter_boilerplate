// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Paging<T> {

 List<T> get items;@JsonKey(name: 'totalCount') int? get totalCount;@JsonKey(name: 'currentCount') int? get currentCount;
/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingCopyWith<T, Paging<T>> get copyWith => _$PagingCopyWithImpl<T, Paging<T>>(this as Paging<T>, _$identity);

  /// Serializes this Paging to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paging<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,currentCount);

@override
String toString() {
  return 'Paging<$T>(items: $items, totalCount: $totalCount, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class $PagingCopyWith<T,$Res>  {
  factory $PagingCopyWith(Paging<T> value, $Res Function(Paging<T>) _then) = _$PagingCopyWithImpl;
@useResult
$Res call({
 List<T> items,@JsonKey(name: 'totalCount') int? totalCount,@JsonKey(name: 'currentCount') int? currentCount
});




}
/// @nodoc
class _$PagingCopyWithImpl<T,$Res>
    implements $PagingCopyWith<T, $Res> {
  _$PagingCopyWithImpl(this._self, this._then);

  final Paging<T> _self;
  final $Res Function(Paging<T>) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = freezed,Object? currentCount = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,currentCount: freezed == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Paging].
extension PagingPatterns<T> on Paging<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paging<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paging<T> value)  $default,){
final _that = this;
switch (_that) {
case _Paging():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paging<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items, @JsonKey(name: 'totalCount')  int? totalCount, @JsonKey(name: 'currentCount')  int? currentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.items,_that.totalCount,_that.currentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items, @JsonKey(name: 'totalCount')  int? totalCount, @JsonKey(name: 'currentCount')  int? currentCount)  $default,) {final _that = this;
switch (_that) {
case _Paging():
return $default(_that.items,_that.totalCount,_that.currentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items, @JsonKey(name: 'totalCount')  int? totalCount, @JsonKey(name: 'currentCount')  int? currentCount)?  $default,) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.items,_that.totalCount,_that.currentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Paging<T> implements Paging<T> {
  const _Paging({required final  List<T> items, @JsonKey(name: 'totalCount') this.totalCount, @JsonKey(name: 'currentCount') this.currentCount}): _items = items;
  factory _Paging.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PagingFromJson(json,fromJsonT);

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'totalCount') final  int? totalCount;
@override@JsonKey(name: 'currentCount') final  int? currentCount;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingCopyWith<T, _Paging<T>> get copyWith => __$PagingCopyWithImpl<T, _Paging<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PagingToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paging<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,currentCount);

@override
String toString() {
  return 'Paging<$T>(items: $items, totalCount: $totalCount, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class _$PagingCopyWith<T,$Res> implements $PagingCopyWith<T, $Res> {
  factory _$PagingCopyWith(_Paging<T> value, $Res Function(_Paging<T>) _then) = __$PagingCopyWithImpl;
@override @useResult
$Res call({
 List<T> items,@JsonKey(name: 'totalCount') int? totalCount,@JsonKey(name: 'currentCount') int? currentCount
});




}
/// @nodoc
class __$PagingCopyWithImpl<T,$Res>
    implements _$PagingCopyWith<T, $Res> {
  __$PagingCopyWithImpl(this._self, this._then);

  final _Paging<T> _self;
  final $Res Function(_Paging<T>) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = freezed,Object? currentCount = freezed,}) {
  return _then(_Paging<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,currentCount: freezed == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
