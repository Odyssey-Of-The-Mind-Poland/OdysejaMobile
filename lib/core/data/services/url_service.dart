import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static Future<bool> openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      final result = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return result;
    } catch (e, s) {
      sl.maybeGet<LoggerService>()?.logError('Failed to launch an url', e, s);
      return false;
    }
  }
}
