import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';
import 'package:odyssey_mobile/domain/entities/loading_config.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._repository) : super(OnboardingInitial()) {
    on<CheckForOnboarding>(_onboardingHandler);
    on<FinishedOnboarding>(_onboardingFinishedHandler);
  }
  final DataRepository _repository;

  void _onboardingHandler(CheckForOnboarding event, Emitter<OnboardingState> emit) {
    final loadingConfig = _repository.loadingConfig;
    emit(OnboardingResult(loadingConfig.showOnboarding));
  }

  void _onboardingFinishedHandler(FinishedOnboarding event, Emitter<OnboardingState> emit) {
    _repository.updateLoadingConfig = LoadingConfig(showOnboarding: false);
    emit(const OnboardingFinished());
  }
}
