enum EnvConfig {
  production(
    baseUrl: 'https://grzybek.snet.ovh',
    appleId: '1616380523',
    playStoreId: 'pl.odyssey.lappka',
  ),
  development(
    baseUrl: 'https://grzybek.snet.ovh',
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
