import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/components/position_indicator_item.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/onboarding_bloc.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/welcome_first_page_content.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/welcome_second_page_content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _index = 0;
  final _transitionDuration = const Duration(milliseconds: 330);
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const WelcomeFirstPageContent(),
      const WelcomeSecondPageContent(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSwitcher(duration: _transitionDuration, child: pages[_index]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      pages.length, (index) => PositionIndicatorItem(_index == index)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            //   onPressed: !_isLast ? () => setState(() => ++_index) : () => setState(() => --_index),
            onPressed: !_isLast
                ? () => setState(() => ++_index)
                : () => context.read<OnboardingBloc>().add(const FinishedOnboarding()),
            child: AnimatedSwitcher(
                duration: AppValues.defaultAnimationDuration,
                child: Text(_isLast ? AppStrings.beginButtonLabel : AppStrings.nextButtonLabel)),
          ),
        ],
      ),
    ));
  }

  bool get _isLast => _index == pages.length - 1;
}
