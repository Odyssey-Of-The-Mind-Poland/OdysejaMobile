import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
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
          child: Html(
            data: widget.info.infoText,
            customRenders: {tableMatcher(): tableRender()},
            onLinkTap: (url, _, __, ___) => _launchURL(url, context),
          ),
        ));
  }

  // // TODO move to a better place, refactor, etc
  void _launchURL(String? url, BuildContext context) async {
    if (url == null) {
      return;
    }
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      showSnackBar(context: context, text: 'Nie udało się otworzyć strony :(');
    }
  }
}
