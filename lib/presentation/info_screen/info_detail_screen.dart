import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';

// import 'package:odyssey_mobile/presentation/info_screen/markdown_examples.dart';
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
      body: Markdown(
        data: info.infoText,
        // data: md,
        selectable: false,
        softLineBreak: true,
        onTapLink: _launchURL,
        styleSheet: MarkdownStyleSheet(
          textAlign: getAlignByInfo(),
          h1Align: getAlignByInfo(),
          h2Align: getAlignByInfo(),
          h3Align: getAlignByInfo(),
          h4Align: getAlignByInfo(),
          h4: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.1),
          h3: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.1),
          tableColumnWidth: const IntrinsicColumnWidth(),
          tableBody: AppTextStyles.bodyText2,
          tableHeadAlign: TextAlign.center,
          tableHead: AppTextStyles.bodyText2,
          p: AppTextStyles.bodyText2,
          strong: AppTextStyles.pBoldMd,
          pPadding: const EdgeInsets.only(top: 4, bottom: 8),
          h1Padding: const EdgeInsets.only(top: 16),
          h1: AppTextStyles.h1Md,
          h2: AppTextStyles.h2Md,
          h3Padding: const EdgeInsets.only(bottom: 8, top: 8),
          blockquoteAlign: WrapAlignment.center,
          blockquoteDecoration: const BoxDecoration(),
          listBullet: const TextStyle(fontSize: 17), //bigger  większe
        ),
      ),
    );
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
