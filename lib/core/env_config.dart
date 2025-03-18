enum EnvConfig {
  production(baseUrl: 'http://grzybek.snet.ovh'),
  development(baseUrl: 'http://grzybek.snet.ovh');

  final String baseUrl;

  const EnvConfig({required this.baseUrl});
}
