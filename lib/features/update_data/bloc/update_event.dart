part of 'update_bloc.dart';

sealed class UpdateEvent {
  const UpdateEvent();
}

class CheckForUpdatesEvent extends UpdateEvent {
  const CheckForUpdatesEvent({this.isBoot = false});

  final bool isBoot;
}

class SkipAppUpdateEvent extends UpdateEvent {
  const SkipAppUpdateEvent();
}
