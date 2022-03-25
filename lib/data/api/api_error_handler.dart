import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';

/// API doesn't offer robust documentation nor standarization,
/// so the method takes some liberties. Hopefully a subject to change.
Failure dioErrorHandler(DioError e) {
  switch (e.type) {
    case DioErrorType.response:
      switch (e.response?.statusCode) {
        case 500:
          return const ServerFailure();
        default:
          return unknownErrorHandler(e, null);
      }
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      return const TimeoutFailure();
    case DioErrorType.cancel:
    case DioErrorType.other:
      return const ConnectionFailure();
  }
}

Failure unknownErrorHandler(dynamic e, StackTrace? s) {
  log('Unknown error', error: e, stackTrace: s);
  return const UnknownFailure();
}
