import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';

import '../../../core/data/load_data_repository.dart';

part 'update_favourites_event.dart';
part 'update_favourites_state.dart';

class UpdateFavouritesBloc extends Bloc<UpdateFavouritesEvent, UpdateFavouritesState> {
  UpdateFavouritesBloc(this._repository) : super(const UpdateFavouritesInitial()) {
    on<Update>(_updateFavHandler);
    on<Toggle>(_toggleFavHandler);
  }
  final LoadDataRepository _repository;

  /// Updates with given [isFavourite] value.
  Future<void> _updateFavHandler(Update event, Emitter<UpdateFavouritesState> emit) async {
    final result = await _repository.updateFavourite(event.performance);
    result.fold(
      (l) => emit(UpdateFavouritesError(l)),
      (_) => emit(UpdateFavouritesSuccess(event.performance)),
    );
  }

  /// Updates with internaly negated [isFavourite] value.
  Future<void> _toggleFavHandler(Toggle event, Emitter<UpdateFavouritesState> emit) async {
    final performance = event.performance..isFavourite = !event.performance.isFavourite;
    final result = await _repository.updateFavourite(performance);
    result.fold(
      (l) => emit(UpdateFavouritesError(l)),
      (_) => emit(UpdateFavouritesSuccess(performance)),
    );
  }
}
