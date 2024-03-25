// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class StateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType}\n${change.currentState}\n${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace\n');
    super.onError(bloc, error, stackTrace);
  }
}
