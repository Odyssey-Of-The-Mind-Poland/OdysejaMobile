import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/injectable.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/onboarding_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/app/router.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final GlobalKey<AutoRouterState> _innerRouterKey;
  StackRouter? router;

  @override
  void initState() {
    super.initState();
    _innerRouterKey = GlobalKey<AutoRouterState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
            create: (context) => getIt<OnboardingBloc>()..add(const CheckForOnboarding())),
      ],
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) async {
          router = _innerRouterKey.currentState?.controller;
          if (state is OnboardingResult) {
            if (state.showOnboarding) {
              router?.replace(const WelcomeRoute());
            } else {
              router?.replace(const LoadingRoute());
            }
          } else if (state is OnboardingFinished) {
            if (context.read<UpdateBloc>().state is UpdateFinished) {
              router?.replaceAll([const MainRoute()]);
            } else {
              router?.replace(const LoadingRoute());
            }
          }
        },
        child: AutoRouter(key: _innerRouterKey),
      ),
    );
  }
}
