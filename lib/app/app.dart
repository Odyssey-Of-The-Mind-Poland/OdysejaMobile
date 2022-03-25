import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/router.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';

class OdysseyMobile extends StatelessWidget {
  OdysseyMobile({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: AppStrings.title,
      theme: lightTheme,
    );
  }
}
