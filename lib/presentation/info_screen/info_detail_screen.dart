import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/data/services/url_service.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';

@RoutePage()
class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({required this.info, super.key});
  final Info info;

  @override
  State<InfoDetailScreen> createState() => _InfoDetailScreenState();
}

class _InfoDetailScreenState extends State<InfoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.info.infoName),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(
              widget.info.infoText,
              onTapUrl: (url) => _launchURL(url, context),
            ),
          ),
        ));
  }

  Future<bool> _launchURL(String? url, BuildContext context) async {
    if (url == null) {
      return false;
    }
    if (!await UrlLauncher.openUrl(url) && context.mounted) {
      showSnackBar(context: context, text: const UrlLauncherFailure().errorMessage);
      return false;
    }
    return true;
  }
}
