import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:odyssey_mobile/app/app.dart';
import 'package:odyssey_mobile/app/injectable.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Ubuntu/OFL.txt');
    yield LicenseEntryWithLineBreaks(['ubuntu'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();

  await sl.init();

  runApp(OdysseyMobile());
}
