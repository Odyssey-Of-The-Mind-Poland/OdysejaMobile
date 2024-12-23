part of 'city_bloc.dart';

abstract class CityState {
  const CityState();
}

class CityLoading extends CityState {
  const CityLoading();
}

class CityError extends CityState {
  final Failure failure;

  const CityError(this.failure);
}

class CitySuccess extends CityState {
  final List<CityHiveModel> cities;

  const CitySuccess(this.cities);
}
