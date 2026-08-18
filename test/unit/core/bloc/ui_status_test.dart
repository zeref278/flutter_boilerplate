import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('exhaustive switch covers every variant without a default', () {
    String describe(UIStatus status) => switch (status) {
      UIInitial() => 'initial',
      UILoading() => 'loading',
      UILoadFailed() => 'failed',
      UILoadSuccess() => 'success',
    };

    expect(describe(const UIStatus.initial()), 'initial');
    expect(describe(const UIStatus.loading()), 'loading');
    expect(
      describe(
        const UIStatus.loadFailed(failure: NetworkFailure(message: 'x')),
      ),
      'failed',
    );
    expect(describe(const UIStatus.loadSuccess()), 'success');
  });

  test('carries the failure object rather than a string', () {
    const UIStatus status = UIStatus.loadFailed(
      failure: TimeoutFailure(message: 'slow'),
    );

    expect((status as UILoadFailed).failure, isA<TimeoutFailure>());
  });
}
