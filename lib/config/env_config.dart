enum EnvConfig {
  production(baseUrl: 'http://grzybek.snet.ovh:8082'),
  development(baseUrl: 'http://grzybek.snet.ovh:8082');

  final String baseUrl;

  const EnvConfig({required this.baseUrl});
}
