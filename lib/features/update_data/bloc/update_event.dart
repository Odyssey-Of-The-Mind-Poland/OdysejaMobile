part of 'update_bloc.dart';

sealed class UpdateEvent {
  const UpdateEvent();
}

class CheckForUpdatesEvent extends UpdateEvent {
  const CheckForUpdatesEvent({this.forceUpdate = false});

  final bool forceUpdate;
}
