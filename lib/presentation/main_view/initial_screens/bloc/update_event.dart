part of 'update_bloc.dart';

@immutable
abstract class UpdateEvent {
  const UpdateEvent();
}

class StartUpdateProcess extends UpdateEvent {
  const StartUpdateProcess();
}
