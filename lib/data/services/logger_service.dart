import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:odyssey_mobile/presentation/state_observer.dart';

class LoggerService {
  LoggerService._();
  late final Logger logger;

  static LoggerService create() {
    final service = LoggerService._();
    service._init();
    return service;
  }

  _init() {
    logger = Logger('Łappka Omera');

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    if (kDebugMode) {
      Bloc.observer = StateObserver();
    }

    if (kDebugMode) return;
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
      if (record.level != Level.SEVERE) {
        return;
      }
      FirebaseCrashlytics.instance.recordError(
        record.error,
        record.stackTrace,
        reason: record.message,
        fatal: true,
      );
    });
  }

  static void logInfo(String message, Object? e, StackTrace? s) => Logger.root.info(message, e, s);

  static void logWarning(String message, Object? e, StackTrace? s) =>
      Logger.root.warning(message, e, s);

  static void logError(String message, Object? e, StackTrace? s) =>
      Logger.root.severe(message, e, s);
}
