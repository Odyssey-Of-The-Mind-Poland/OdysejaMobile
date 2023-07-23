import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as html;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:odyssey_mobile/data/services/url_service.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';

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
            onLinkTap: _onLinkTap,
            extensions: const [TableHtmlExtension()],
          ),
        ));
  }

  Future<void> _onLinkTap(
      String? url, Map<String, String> attributes, html.Element? element) async {
    if (url == null) {
      return;
    }
    final result = await UrlLauncher.openUrl(url);
    result.fold(
      () => null,
      (failure) => showSnackBar(context: context, text: failure.errorMessage),
    );
  }
}
