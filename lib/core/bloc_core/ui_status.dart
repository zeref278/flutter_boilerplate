import 'package:flutter/material.dart';

enum UIStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

extension UIStatusExtension on UIStatus {
  Widget when({
    Widget Function()? onInitial,
    required Widget Function() onLoading,
    required Widget Function() onLoadFailure,
    required Widget Function() onLoadSuccess,
  }) {
    switch (this) {
      case UIStatus.initial:
        return onInitial?.call() ?? onLoading();
      case UIStatus.loading:
        return onLoading();
      case UIStatus.loadFailure:
        return onLoadFailure();
      case UIStatus.loadSuccess:
        return onLoadSuccess();
    }
  }
}
