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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: height > 700
          ? const EdgeInsets.symmetric(horizontal: 40, vertical: 80)
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 460,
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInQuart,
                  switchOutCurve: Curves.easeOutQuart,
                  duration: AppValues.longerAnimationDuration,
                  child: pages[_index])),
          Padding(
            padding: height > 700
                ? const EdgeInsets.symmetric(vertical: 60)
                : const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(pages.length, (index) => PositionIndicatorItem(_index == index)),
            ),
          ),
          ElevatedButton(
            // Debug override
            // onPressed: !_isLast ? () => setState(() => ++_index) : () => setState(() => --_index),
            onPressed: !_isLast
                ? () => setState(() => ++_index)
                : () => context.read<OnboardingBloc>().add(const FinishedOnboarding()),
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeInQuart,
              switchOutCurve: Curves.easeOutQuart,
              duration: AppValues.longerAnimationDuration,
              child: Text(
                _isLast ? AppStrings.beginButtonLabel : AppStrings.nextButtonLabel,
                key: Key('$_isLast'),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  bool get _isLast => _index == pages.length - 1;
}
