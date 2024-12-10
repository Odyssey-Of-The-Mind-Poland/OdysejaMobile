import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/injectable.dart';
import 'package:odyssey_mobile/presentation/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/presentation/router.dart';

class OdysseyMobile extends StatelessWidget {
  OdysseyMobile({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateBloc(sl())..add(const StartUpdateProcess()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: AppStrings.title,
        theme: lightTheme,
      ),
    );
  }
}
