import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/data/failures.dart';
import 'package:odyssey_mobile/domain/failure.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static Future<Option<Failure>> openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      final result = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return result ? none() : some(const UrlLauncherFailure());
    } catch (_) {
      return some(const UrlLauncherFailure());
    }
  }
}
