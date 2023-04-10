import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
}

@Environment('prod')
@Injectable(as: AppConfig)
class ProductionConfig implements AppConfig {
  @override
  String get baseUrl => 'https://grzybek.snet.ovh';
}
