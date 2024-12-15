abstract class AppConfig {
  String get baseUrl;
}

class ProductionConfig implements AppConfig {
  @override
  String get baseUrl => 'https://grzybek.snet.ovh';
}

class DevConfig implements AppConfig {
  @override
  String get baseUrl => 'http://grzybek.snet.ovh';
}
