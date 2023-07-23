import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc(this._repository) : super(const UpdateLoading()) {
    on<StartUpdateProcess>(_startUpdateHandler);
  }
  final DataRepository _repository;

  Future<void> _startUpdateHandler(StartUpdateProcess event, Emitter<UpdateState> emit) async {
    emit(const UpdateLoading());
    final result =
        await _repository.updateData(forceUpdate: event.forceUpdate, keepFavsOnUpdate: true);
    result.fold(
      (l) {
        if (l is Offline) {
          emit(const UpdateFinished());
        } else {
          emit(UpdateFailed(l));
        }
      },
      (_) => emit(const UpdateFinished()),
    );
  }
}
