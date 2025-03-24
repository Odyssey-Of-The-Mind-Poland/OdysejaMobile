part of 'update_bloc.dart';

sealed class UpdateState {
  const UpdateState();
}

class UpdateLoading extends UpdateState {
  const UpdateLoading();
}

class AppUpdateRequired extends UpdateState {
  const AppUpdateRequired();
}

class UpdateFinished extends UpdateState {
  const UpdateFinished({this.appUpdateRecommended = false});

  final bool appUpdateRecommended;
}

class UpdateFailed extends UpdateState {
  const UpdateFailed(this.failure, {this.offlineModeAvailable = false});
  final Failure failure;
  final bool offlineModeAvailable;
}
