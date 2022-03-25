part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class CheckForOnboarding extends OnboardingEvent {
  const CheckForOnboarding();
}

class FinishedOnboarding extends OnboardingEvent {
  const FinishedOnboarding();
}
