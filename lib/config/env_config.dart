enum EnvConfig {
  production(
    baseUrl: 'https://grzybek.snet.ovh',
    appleId: '1616380523',
    playStoreId: 'pl.odyssey.lappka',
  ),
  // Debug builds only. Point them at a local backend with
  // `--dart-define=API_BASE_URL=http://localhost:8081` (Android emulator: http://10.0.2.2:8081,
  // physical device: http://<LAN address of the computer>:8081).
  development(
    baseUrl: String.fromEnvironment('API_BASE_URL', defaultValue: 'https://grzybek.snet.ovh'),
    appleId: '1616380523',
    playStoreId: 'pl.odyssey.lappka',
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
