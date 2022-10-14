// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'collection_pagination.freezed.dart';
part 'collection_pagination.g.dart';

/// Model base to get data from api pagination response
/// Loadmore using this, example CollectionPagination<DogImage>
@Freezed(
  genericArgumentFactories: true,
)
class CollectionPagination<T> with _$CollectionPagination<T> {
  const factory CollectionPagination({
    @JsonKey(name: 'totalCount') int? totalCount,
    @JsonKey(name: 'currentCount') int? currentCount,
    required List<T> items,
  }) = _CollectionPagination;

  factory CollectionPagination.fromJson(
      Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$CollectionPaginationFromJson(json, fromJsonT);
}
