import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/app/app.dart';
import 'package:odyssey_mobile/injectable.dart';
import 'package:logging/logging.dart';
import 'package:odyssey_mobile/presentation/core/bloc/state_observer.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Ubuntu/OFL.txt');
    yield LicenseEntryWithLineBreaks(['ubuntu'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(Environment.prod);

  if (kDebugMode) {
    Logger.root.level = Level.FINE; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    BlocOverrides.runZoned(() {
      runApp(OdysseyMobile());
    }, blocObserver: StateObserver());
  } else {
    runApp(OdysseyMobile());
  }
}
