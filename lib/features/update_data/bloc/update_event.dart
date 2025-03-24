part of 'update_bloc.dart';

sealed class UpdateEvent {
  const UpdateEvent();
}

class BootstrapEvent extends UpdateEvent {
  const BootstrapEvent();
}

class CheckForUpdatesEvent extends UpdateEvent {
  const CheckForUpdatesEvent();
}
