import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';
// import 'package:odyssey_mobile/presentation/info_screen/markdown_examples.dart';

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
        onTapLink: (label, link, tooltip) => print([label, link, tooltip]),
        styleSheet: MarkdownStyleSheet(
            tableColumnWidth: const IntrinsicColumnWidth(),
            tableBody: AppTextStyles.bodyText2,
            tableHeadAlign: TextAlign.center,
            tableHead: AppTextStyles.bodyText2,
            p: AppTextStyles.bodyText2,
            strong: AppTextStyles.pBoldMd,
            pPadding: const EdgeInsets.only(top: 4, bottom: 8),
            h1Padding: const EdgeInsets.only(top: 8),
            h1: AppTextStyles.h1Md,
            h2: AppTextStyles.h2Md,
            h3Padding: const EdgeInsets.only(bottom: 4, top: 4),
            // h3: AppTextStyles.h1Md,
            // blockSpacing: 16,
            blockquoteAlign: WrapAlignment.center,
            blockquoteDecoration: const BoxDecoration(),
            listBullet: TextStyle(fontSize: 16) // większe
            ),
      ),
    );
  }
}
