import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/core/typedefs.dart';

// TODO: Replace with fpdart implementation
/// Based on Future.wait() implementation.
extension EitherWait on List<AsyncResult> {
  AsyncResult<List<Either<Failure, T>>> wait<T>({bool eagerError = true}) async {
    final results = List<Either<Failure, T>?>.filled(length, null);
    final completer = Completer<Either<Failure, List<Either<Failure, T>>>>();

    int remaining = length;

    for (int i = 0; i < length; i++) {
      this[i].then((value) {
        value.fold(
          (l) {
            if (eagerError) {
              completer.complete(left(l));
              return;
            }
            results[i] = left(l);
          },
          (r) => results[i] = right(r),
        );
        remaining--;
        if (remaining == 0 && !completer.isCompleted) {
          final result = right<Failure, List<Either<Failure, T>>>(results.map((e) => e!).toList());
          completer.complete(result);
        }
      });
    }
    return await completer.future;
  }
}

extension EitherX<L, R> on Either<L, R> {
  /// Not type safe!
  R asRight() => (this as Right<L, R>).value;

  /// Not type safe!
  L asLeft() => (this as Left<L, R>).value;
}
