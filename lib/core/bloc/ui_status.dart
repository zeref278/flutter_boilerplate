import 'package:boilerplate/core/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_status.freezed.dart';

/// Screen-level load state.
///
/// `loadFailed` carries a [Failure] rather than a String so the UI can branch
/// on error kind — offering retry only where retrying helps.
@Freezed(fromJson: false, toJson: false)
sealed class UIStatus with _$UIStatus {
  const factory UIStatus.initial() = UIInitial;

  const factory UIStatus.loading() = UILoading;

  const factory UIStatus.loadFailed({required Failure failure}) = UILoadFailed;

  const factory UIStatus.loadSuccess({String? message}) = UILoadSuccess;
}
