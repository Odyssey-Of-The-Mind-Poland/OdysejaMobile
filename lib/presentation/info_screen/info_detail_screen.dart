import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({required this.info, Key? key}) : super(key: key);
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

  // // TODO move to a better place, refactor, etc
  Future<bool> _launchURL(String? url, BuildContext context) async {
    if (url == null) {
      return true;
    }
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      showSnackBar(context: context, text: 'Nie udało się otworzyć strony :(');
    }
    return true;
  }
}
