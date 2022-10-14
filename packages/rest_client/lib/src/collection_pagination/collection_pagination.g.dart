// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CollectionPagination<T> _$$_CollectionPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_CollectionPagination<T>(
      totalCount: json['totalCount'] as int?,
      currentCount: json['currentCount'] as int?,
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_CollectionPaginationToJson<T>(
  _$_CollectionPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'items': instance.items.map(toJsonT).toList(),
    };
