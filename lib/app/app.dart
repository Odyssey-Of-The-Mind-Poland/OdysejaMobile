import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/features/update_data/bloc/update_bloc.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/app/themes/theme_dark.dart';
import 'package:odyssey_mobile/app/themes/theme_light.dart';
import 'package:odyssey_mobile/app/injectable.dart';

class OdysseyMobile extends StatelessWidget {
  OdysseyMobile({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateBloc(sl())..add(const BootCheckEvent()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: AppStrings.title,
        themeMode: ThemeMode.system,
        theme: themeLight,
        darkTheme: themeDark,
      ),
    );
  }
}
