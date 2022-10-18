// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Paging<T> _$$_PagingFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Paging<T>(
      totalCount: json['totalCount'] as int?,
      currentCount: json['currentCount'] as int?,
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_PagingToJson<T>(
  _$_Paging<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'items': instance.items.map(toJsonT).toList(),
    };
