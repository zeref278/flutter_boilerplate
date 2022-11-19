part of 'application_bloc.dart';

@Freezed()
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @Default(UIStatus.loading) UIStatus status,
    @Default('en') String locale,
    @Default(false) bool isDarkMode,
  }) = _ApplicationState;
}

enum UIStatus {
  initial,
  loading,
  loadSuccess,
  loadFailed,
}

extension UIStatusExtension on UIStatus {
  Widget when({
    Widget Function()? onInitial,
    required Widget Function() onLoading,
    required Widget Function() onLoadFailed,
    required Widget Function() onLoadSuccess,
  }) {
    switch (this) {
      case UIStatus.initial:
        return onInitial?.call() ?? onLoading();
      case UIStatus.loading:
        return onLoading();
      case UIStatus.loadFailed:
        return onLoadFailed();
      case UIStatus.loadSuccess:
        return onLoadSuccess();

      default:
        return onLoading();
    }
  }
}
