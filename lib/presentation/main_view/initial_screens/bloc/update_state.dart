part of 'update_bloc.dart';

@immutable
abstract class UpdateState {
  const UpdateState();
}

class UpdateLoading extends UpdateState {
  const UpdateLoading();
}

class UpdateFinished extends UpdateState {
  const UpdateFinished();
}

class UpdateFailed extends UpdateState {
  const UpdateFailed(this.failure);
  final Failure failure;
}
