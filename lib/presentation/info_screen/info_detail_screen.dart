import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
      body: Markdown(data: info.infoText, selectable: true),
    );
  }
}
