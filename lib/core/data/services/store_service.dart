import 'dart:io';

import 'package:app_version_update/app_version_update.dart';
import 'package:odyssey_mobile/app/injectable.dart';

import 'package:odyssey_mobile/config/env_config.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';

// TODO: Replace app_version_update package with a custom solution
class StoreService {
  const StoreService({required EnvConfig config}) : _config = config;

  final EnvConfig _config;

  static const _storeCountry = 'pl';
  static const _playStoreFallback = 'https://play.google.com/store/apps/details?id=';
  static const _appStoreFallback = 'https://apps.apple.com/app/id';

  String get storeUrl {
    if (Platform.isIOS) {
      return '$_appStoreFallback${_config.appleId}';
    } else if (Platform.isAndroid) {
      return '$_playStoreFallback${_config.playStoreId}';
    }
    throw Exception('Platform not supported');
  }

  /// Check platform stores (App Store, Play Store) for available app versions.
  /// In case of a service failure, will return [StoreData] with only store url.
  Future<StoreData?> checkForUpdates() async {
    try {
      final value = await AppVersionUpdate.checkForUpdates(
        country: _storeCountry,
        appleId: _config.appleId,
        playStoreId: _config.playStoreId,
      );
      final version = value.storeVersion;
      final can = value.canUpdate;

      if (version == null || can == null) {
        return null;
      }

      return StoreData(storeVersion: version, canUpdate: can);
    } on Exception catch (_, __) {
      return null;
    } on String catch (e, s) {
      sl.maybeGet<LoggerService>()?.logError('StoreService error', e, s);
      return null;
    }
  }
}

class StoreData {
  StoreData({
    required this.storeVersion,
    required this.canUpdate,
  });

  final String storeVersion;
  final bool canUpdate;
}
