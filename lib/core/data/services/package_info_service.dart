import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  PackageInfoService._();

  late final PackageInfo info;

  static Future<PackageInfoService> create() async {
    final service = PackageInfoService._();
    await service._init();

    return service;
  }

  Future<void> _init() async {
    info = await PackageInfo.fromPlatform();
  }

  String get version => info.version;
}
