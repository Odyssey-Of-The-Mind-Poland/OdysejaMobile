part of 'onboarding_bloc.dart';

abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {}

class OnboardingResult extends OnboardingState {
  const OnboardingResult(this.showOnboarding);
  final bool showOnboarding;
}

class OnboardingFinished extends OnboardingState {
  const OnboardingFinished();
}
