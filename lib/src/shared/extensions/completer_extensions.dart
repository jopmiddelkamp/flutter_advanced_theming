import 'dart:async';

export '../extensions/completer_extensions.dart';

extension CompleterX<TResult> on Completer<TResult> {
  void completeIfNotCompleted([
    FutureOr<TResult>? value,
  ]) {
    if (isCompleted) {
      return;
    }
    complete(
      value,
    );
  }
}
