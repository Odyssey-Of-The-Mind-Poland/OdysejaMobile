import 'package:app_version_update/app_version_update.dart';
import 'package:app_version_update/core/functions/convert_version.dart';

import 'package:odyssey_mobile/config/env_config.dart';

class StoreService {
  const StoreService({required EnvConfig config}) : _config = config;

  final EnvConfig _config;

  static const _storeCountry = 'pl';

  Future<StoreData> checkForUpdates() => AppVersionUpdate.checkForUpdates(
        country: _storeCountry,
        appleId: _config.appleId,
        playStoreId: _config.playStoreId,
      ).then(
        (value) => StoreData(storeUrl: value.storeUrl, storeVersion: value.storeVersion),
      );

  bool canUpdate({required String version, String? versionStore}) =>
      convertVersion(version: version, versionStore: versionStore);
}

class StoreData {
  StoreData({
    required this.storeUrl,
    required this.storeVersion,
  });

  final String? storeUrl;
  final String? storeVersion;

  @override
  String toString() => 'StoreData(storeUrl: $storeUrl, storeVersion: $storeVersion)';
}
