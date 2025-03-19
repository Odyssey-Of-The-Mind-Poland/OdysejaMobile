import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/data/data_repository.dart';
import '../../../core/data/db/hive/models/city.dart';
import '../../../core/failure.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc(this._repository) : super(CityLoading()) {
    on<FetchCities>((event, emit) {
      final result = _repository.getCities();

      result.fold((l) => emit(CityError(l)), (r) => emit(CitySuccess(r.toList())));
    });
  }

  final DataRepository _repository;
}
