import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
// import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDetailScreen extends StatelessWidget {
  const InfoDetailScreen({required this.info, Key? key}) : super(key: key);
  final Info info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(info.infoName),
          centerTitle: true,
        ),
        body: Html(
          data: info.infoText,
          customRenders: {tableMatcher(): tableRender()},
        ));
  }

  // Przepraszam
  WrapAlignment getAlignByInfo() =>
      info.infoName.contains('Dzięki') ? WrapAlignment.center : WrapAlignment.start;

  // TODO move to a better place, refactor, etc
  void _launchURL(String label, String? link, String? tooltip) async {
    final _url = tooltip != null ? link ?? '' : 'tel:$link';

    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
