part of 'city_data_bloc.dart';

abstract class CityDataState {
  const CityDataState();
}

class CityDataLoading extends CityDataState {
  const CityDataLoading();
}

class CityDataError extends CityDataState {
  final Failure failure;

  const CityDataError(this.failure);
}

class CityDataSuccess extends CityDataState {
  final CityData cityData;
  final List<ScheduleCategoryEntity> problems;

  const CityDataSuccess(this.cityData, this.problems);
}
