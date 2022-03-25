part of 'city_data_bloc.dart';

abstract class CityDataEvent {
  const CityDataEvent();
}

class FetchCityData extends CityDataEvent {
  const FetchCityData();
}

class UpdateFavourites extends CityDataEvent {
  const UpdateFavourites(this.performance);
  final Performance performance;
}
