import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/presentation/components/position_indicator_item.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/onboarding_bloc.dart';
import 'package:odyssey_mobile/app/strings.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _index = 0;
  final _transitionDuration = const Duration(milliseconds: 330);
  late final List<WelcomeScreenPage> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      WelcomeScreenPage(
        content: Column(
          children: [
            Text(AppStrings.welcomeScreenPage1Title),
            Container(),
          ],
        ),
        button: ElevatedButton(
            onPressed: () => setState(() => ++_index),
            child: const Text(AppStrings.welcomeScreenPage1ButtonLabel)),
      ),
      WelcomeScreenPage(
        content: Column(
          key: const Key('2'),
          children: [
            Text(AppStrings.welcomeScreenPage2Title),
            Container(),
          ],
        ),
        button: ElevatedButton(
            key: const Key('2'),
            // onPressed: () => setState(() => --_index),
            onPressed: () => context.read<OnboardingBloc>().add(const FinishedOnboarding()),
            child: const Text(AppStrings.welcomeScreenPage2ButtonLabel)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(duration: _transitionDuration, child: pages[_index].content),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(pages.length, (index) => PositionIndicatorItem(_index == index)),
          ),
          AnimatedSwitcher(duration: _transitionDuration, child: pages[_index].button),
        ],
      ),
    ));
  }
}

class WelcomeScreenPage {
  WelcomeScreenPage({
    required this.content,
    required this.button,
  });

  final Widget content;
  final Widget button;
}
