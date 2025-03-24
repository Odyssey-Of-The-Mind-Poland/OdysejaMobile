enum EnvConfig {
  production(
    baseUrl: 'http://grzybek.snet.ovh:8082',
    appleId: '1616380523',
    playStoreId: '',
  ),
  development(
    baseUrl: 'http://grzybek.snet.ovh:8082',
    appleId: '1616380523',
    playStoreId: '',
  );

  final String baseUrl;
  final String appleId;
  final String playStoreId;

  const EnvConfig({
    required this.baseUrl,
    required this.appleId,
    required this.playStoreId,
  });
}
