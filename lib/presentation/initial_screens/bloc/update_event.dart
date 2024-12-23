part of 'update_bloc.dart';

abstract class UpdateEvent {
  const UpdateEvent();
}

class StartUpdateProcess extends UpdateEvent {
  const StartUpdateProcess([this.forceUpdate = true]);
  final bool forceUpdate;
}
