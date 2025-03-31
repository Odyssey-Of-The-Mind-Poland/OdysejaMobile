part of 'update_bloc.dart';

sealed class UpdateEvent {
  const UpdateEvent();
}

class CheckForUpdatesEvent extends UpdateEvent {
  const CheckForUpdatesEvent();
}

class RetryCheckEvent extends UpdateEvent {
  const RetryCheckEvent();
}

class BootCheckEvent extends UpdateEvent {
  const BootCheckEvent();
}

class SkipAppUpdateEvent extends UpdateEvent {
  const SkipAppUpdateEvent();
}
