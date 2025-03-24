import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  Future<PackageInfo> getPackageInfo() => PackageInfo.fromPlatform();
}
