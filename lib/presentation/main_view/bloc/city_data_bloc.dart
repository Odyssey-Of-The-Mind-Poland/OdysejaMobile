import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'city_data_event.dart';
part 'city_data_state.dart';

@injectable
class CityDataBloc extends Bloc<CityDataEvent, CityDataState> {
  CityDataBloc(this._repository) : super(const CityDataLoading()) {
    on<FetchCityData>(_fetchHandler);
  }
  final DataRepository _repository;

  Future<void> _fetchHandler(FetchCityData event, Emitter<CityDataState> emit) async {
    // TODO add proper city selection
    final result = await _repository.getCityData(0);
    // TODO move to a separate bloc
    final result2 = await _repository.getProblems();

    result.fold((l) => emit(CityDataError(l)),
        (r) => result2.fold((l) => emit(CityDataError(l)), (r2) => emit(CityDataSuccess(r, r2))));
  }
}
