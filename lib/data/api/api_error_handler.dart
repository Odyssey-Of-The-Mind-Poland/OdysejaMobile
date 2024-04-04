import 'package:dio/dio.dart';
import 'package:odyssey_mobile/data/failures.dart';
import 'package:odyssey_mobile/data/services/logger_service.dart';
import 'package:odyssey_mobile/domain/failure.dart';
import 'package:odyssey_mobile/injectable.dart';

/// API doesn't offer robust documentation nor standarization,
/// so the method takes some liberties. Hopefully a subject to change.
Failure dioErrorHandler(DioException e, StackTrace s) {
  switch (e.type) {
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 500:
          return const ServerFailure();
        default:
          return unknownErrorHandler(e, s);
      }
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutFailure();
    case DioExceptionType.cancel:
    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return const ConnectionFailure();
  }
}

Failure unknownErrorHandler(dynamic e, StackTrace? s) {
  sl.maybeGet<LoggerService>()?.logError('Unknown error', e, s);
  return const UnknownFailure();
}
