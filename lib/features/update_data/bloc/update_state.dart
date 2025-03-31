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
  const AppUpdateRequired({required this.status, required this.offlineAvailable});

  final AppUpdateStatus status;
  final bool offlineAvailable;
}

class UpdateFinished extends UpdateState {
  const UpdateFinished(this.status);

  final AppUpdateStatus status;

  bool get isUpdateRecommended => status == AppUpdateStatus.recommended;
}

class UpdateFailed extends UpdateState {
  const UpdateFailed(this.failure, {this.offlineModeAvailable = false});
  final Failure failure;
  final bool offlineModeAvailable;
}

class AppCriticalError extends UpdateState {
  const AppCriticalError();
}
