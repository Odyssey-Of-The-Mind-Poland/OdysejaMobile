// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/data/services/logger_service.dart';

// TODO: Move to logging services.
class StateObserver extends BlocObserver {
  const StateObserver(this._service);

  final LoggerService _service;

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _service.logInfo('${bloc.runtimeType}\n${change.currentState}\n${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _service.logError(bloc.runtimeType.toString(), error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
