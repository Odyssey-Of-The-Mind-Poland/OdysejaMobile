part of 'city_data_bloc.dart';

abstract class CityDataEvent {
  const CityDataEvent();
}

class FetchCityData extends CityDataEvent {
  final int selectedCity;

  const FetchCityData(this.selectedCity);
}

class SelectCity extends CityDataEvent {
  final String selectedCity;

  const SelectCity(this.selectedCity);
}
