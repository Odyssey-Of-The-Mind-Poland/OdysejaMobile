import 'package:odyssey_mobile/core/data/api/models/city.dart';

class CityHiveModel {
  final String name;
  final int id;

  CityHiveModel(this.name, this.id);

  static CityHiveModel fromCityApiModel(CityModelApi city) {
    return CityHiveModel(city.name, city.id);
  }
}
