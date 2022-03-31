import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';

part 'update_event.dart';
part 'update_state.dart';

@injectable
class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc(this._repository) : super(const UpdateLoading()) {
    on<StartUpdateProcess>(_startUpdateHandler);
  }
  final DataRepository _repository;

  Future<void> _startUpdateHandler(StartUpdateProcess event, Emitter<UpdateState> emit) async {
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
