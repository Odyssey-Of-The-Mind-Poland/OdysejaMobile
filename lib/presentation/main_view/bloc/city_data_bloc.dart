import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/domain/city_data.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

part 'city_data_event.dart';
part 'city_data_state.dart';

class CityDataBloc extends Bloc<CityDataEvent, CityDataState> {
  CityDataBloc(this._repository) : super(const CityDataLoading()) {
    on<FetchCityData>(_fetchHandler);
    on<SelectCity>(_selectCityHandler);
  }

  final LoadDataRepository _repository;

  Future<void> _fetchHandler(FetchCityData event, Emitter<CityDataState> emit) async {
    final result = await _repository.getCityData(event.selectedCity);
    final result2 = await _repository.getProblems();

    result.fold(
      (l) => emit(CityDataError(l)),
      (r) => result2.fold(
        (l) => emit(CityDataError(l)),
        (r2) => emit(CityDataSuccess(r, r2)),
      ),
    );
  }

  void _selectCityHandler(SelectCity event, Emitter<CityDataState> emit) {
    if (state is CityDataSuccess) {
      final successState = state as CityDataSuccess;
      emit(CityDataSuccess(
        successState.cityData,
        successState.problems,
      ));
    }
  }
}
