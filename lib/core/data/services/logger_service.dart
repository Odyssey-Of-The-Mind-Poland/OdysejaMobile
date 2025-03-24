import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:odyssey_mobile/core/data/services/firebase_options.dart';

class LoggerService {
  LoggerService._();
  late final Logger logger;

  static Future<LoggerService> create({required bool isWeb}) async {
    final service = LoggerService._();

    if (isWeb) {
      await service._initWeb();
    } else {
      await service._init();
    }

    return service;
  }

  Future<void> _init() async {
    logger = Logger('Łappka Omera');
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        log(_formatLog(record));
      }
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

  Future<void> _initWeb() async {
    logger = Logger('Łappka Omera');

    FlutterError.onError = (error) => logError('FlutterError', error, StackTrace.current);
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      logError('FlutterError', error, stack);
      return true;
    };

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (!kDebugMode) {
        return;
      }
      log(_formatLog(record));
    });
  }

  String _formatLog(LogRecord record) =>
      '${record.level.name}: ${record.time} — ${record.message}: ${record.error}';

  void logInfo(String message, [Object? e, StackTrace? s]) => Logger.root.info(message, e, s);

  void logWarning(String message, [Object? e, StackTrace? s]) => Logger.root.warning(message, e, s);

  void logError(String message, Object? e, StackTrace? s) => Logger.root.severe(message, e, s);
}
