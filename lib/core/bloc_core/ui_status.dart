import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_status.freezed.dart';

/// Ui status: initial, loading, loadSuccess and loadFailed
@Freezed(fromJson: false, toJson: false)
class UIStatus with _$UIStatus {
  const factory UIStatus.initial() = UIInitial;

  const factory UIStatus.loading() = UILoading;

  const factory UIStatus.loadFailed({
    required String message,
  }) = UILoadFailed;

  const factory UIStatus.loadSuccess({
    String? message,
  }) = UILoadSuccess;
}
