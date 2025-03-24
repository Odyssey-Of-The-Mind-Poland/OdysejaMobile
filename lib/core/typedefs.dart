import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/core/failure.dart';

typedef AsyncResult<T> = Future<Either<Failure, T>>;
typedef AsyncVoidResult = Future<Option<Failure>>;
