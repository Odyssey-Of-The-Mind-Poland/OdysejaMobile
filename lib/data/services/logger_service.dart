import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:odyssey_mobile/firebase_options.dart';

class LoggerService {
  LoggerService._();
  late final Logger logger;

  static Future<LoggerService> create() async {
    final service = LoggerService._();
    await service._init();
    return service;
  }

  _init() async {
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
      log('${record.level.name}: ${record.time}: ${record.message}');
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

  void logInfo(String message, [Object? e, StackTrace? s]) => Logger.root.info(message, e, s);

  void logWarning(String message, [Object? e, StackTrace? s]) => Logger.root.warning(message, e, s);

  void logError(String message, Object? e, StackTrace? s) => Logger.root.severe(message, e, s);
}
