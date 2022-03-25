part of 'city_data_bloc.dart';

abstract class CityDataState extends Equatable {
  const CityDataState();

  @override
  List<Object> get props => [];
}

class CityDataSuccess extends CityDataState {
  const CityDataSuccess(this.cityData, this.problems);
  final CityData cityData;
  final List<ScheduleCategoryEntity> problems;
}

class CityDataLoading extends CityDataState {
  const CityDataLoading();
}

class CityDataError extends CityDataState {
  const CityDataError(this.failure);
  final Failure failure;
}
