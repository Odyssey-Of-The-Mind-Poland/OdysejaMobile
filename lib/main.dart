import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:firebase_core/firebase_core.dart';

// import 'package:odyssey_mobile/data/services/logger_service.dart';
// import 'package:odyssey_mobile/firebase_options.dart';
import 'package:odyssey_mobile/presentation/app.dart';
import 'package:odyssey_mobile/injectable.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Ubuntu/OFL.txt');
    yield LicenseEntryWithLineBreaks(['ubuntu'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // LoggerService.create();

  await sl.init();

  runApp(OdysseyMobile());
}
