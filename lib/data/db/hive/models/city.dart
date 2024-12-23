import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';

part 'city.g.dart';

@HiveType(typeId: 8)
class CityHiveModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;

  CityHiveModel(this.name, this.id);

  static CityHiveModel fromCityApiModel(CityModelApi city) {
    return CityHiveModel(city.name, city.id);
  }
}
