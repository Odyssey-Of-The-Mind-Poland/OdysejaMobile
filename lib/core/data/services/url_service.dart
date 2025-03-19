import 'package:url_launcher/url_launcher.dart';

// TODO: Add error logging.
abstract class UrlLauncher {
  static Future<bool> openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      final result = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return result;
    } catch (_) {
      return false;
    }
  }
}
