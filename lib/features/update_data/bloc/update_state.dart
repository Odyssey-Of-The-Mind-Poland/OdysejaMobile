part of 'update_bloc.dart';

sealed class UpdateState {
  const UpdateState();
}

class UpdateInitial extends UpdateState {
  const UpdateInitial();
}

class UpdateLoading extends UpdateState {
  const UpdateLoading();
}

class AppUpdateRequired extends UpdateState {
  const AppUpdateRequired();
}

class UpdateFinished extends UpdateState {
  const UpdateFinished(this.appUpdateStatus);

  final AppUpdateStatus appUpdateStatus;

  bool get isUpdateRecommended => appUpdateStatus == AppUpdateStatus.recommended;
}

class UpdateFailed extends UpdateState {
  const UpdateFailed(this.failure, {this.offlineModeAvailable = false});
  final Failure failure;
  final bool offlineModeAvailable;
}
