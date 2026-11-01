import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;
import 'package:odyssey_mobile/app/themes/theme.dart';

class InfoContent extends StatelessWidget {
  const InfoContent({required this.html, this.onTapUrl, super.key});

  final String html;
  final Future<bool> Function(String url)? onTapUrl;

  @override
  Widget build(BuildContext context) {
    final styles = InfoContentStyles.of(context);
    return HtmlWidget(
      stripInlineStyles(html),
      textStyle: styles.body,
      onTapUrl: onTapUrl,
      customStylesBuilder: styles.cssFor,
      customWidgetBuilder: (element) => element.localName == 'table' ? InfoTable(table: element, onTapUrl: onTapUrl) : null,
    );
  }
}

/// Removes `style` attributes (colours, fonts and sizes pasted from word processors) and legacy
/// presentation attributes, which would otherwise override the theme.
String stripInlineStyles(String html) =>
    html.replaceAll(RegExp(r'''\s(style|color|face|size|bgcolor)\s*=\s*("[^"]*"|'[^']*')''', caseSensitive: false), '');

/// Typography and colours of the content, taken from the active theme.
class InfoContentStyles {
  InfoContentStyles._({
    required this.body,
    required this.bold,
    required this.heading,
    required this.subheading,
    required this.accentLine,
    required this.accent,
    required this.border,
    required this.cell,
  });

  factory InfoContentStyles.of(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;
    final accent = theme.brightness == Brightness.dark ? theme.c.primary.color100! : theme.c.primary.color700!;
    return InfoContentStyles._(
      body: theme.t.bodyMediumRegular!,
      bold: theme.t.bodyMediumBold!,
      heading: theme.t.h3!,
      subheading: theme.t.bodyLargeBold!,
      accentLine: theme.t.bodyLargeBold!.copyWith(color: accent),
      accent: accent,
      border: common.borderColor!,
      cell: common.surfaceColor!,
    );
  }

  final TextStyle body;
  final TextStyle bold;
  final TextStyle heading;
  final TextStyle subheading;
  final TextStyle accentLine;
  final Color accent;
  final Color border;
  final Color cell;

  /// CSS for the elements of the content; paragraphs in table cells have no margin.
  Map<String, String>? cssFor(dom.Element element) {
    switch (element.localName) {
      case 'h2':
        return {..._text(heading), 'margin': '20px 0 8px'};
      case 'h3':
        return {..._text(subheading), 'margin': '16px 0 4px'};
      case 'p':
        return element.classes.contains('accent') ? {..._text(accentLine), 'margin': '0 0 12px'} : {'margin': '0 0 12px'};
      case 'strong':
      case 'b':
        return {'font-weight': '500'};
      case 'a':
        return {'color': _hex(accent), 'text-decoration': 'underline'};
      case 'ul':
      case 'ol':
        return {'margin': '0 0 12px'};
    }
    return null;
  }

  static Map<String, String> _text(TextStyle style) => {
        'font-size': '${style.fontSize}px',
        'font-weight': '${style.fontWeight!.value}',
        'line-height': '${style.height}',
        'color': _hex(style.color!),
      };

  static String _hex(Color color) => '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
}

/// A table as designed: 12px radius, 1px borders between the cells, `th` in bold, `td.accent` in the accent colour.
///
/// Cells are drawn from their inline content only (text, bold, italic, links); a table needs intrinsic
/// sizes, which a full [HtmlWidget] cannot give.
class InfoTable extends StatelessWidget {
  const InfoTable({required this.table, this.onTapUrl, super.key});

  final dom.Element table;
  final Future<bool> Function(String url)? onTapUrl;

  @override
  Widget build(BuildContext context) {
    final styles = InfoContentStyles.of(context);
    final rows = [
      for (final row in table.querySelectorAll('tr'))
        [for (final cell in row.children) if (cell.localName == 'td' || cell.localName == 'th') cell],
    ].where((cells) => cells.isNotEmpty).toList();
    if (rows.isEmpty) return const SizedBox.shrink();

    final columns = rows.map((r) => r.length).reduce((a, b) => a > b ? a : b);
    // Short columns (times, numbers) hug their content, the rest shares what is left.
    final widths = <int, TableColumnWidth>{
      for (var i = 0; i < columns; i++)
        i: i < columns - 1 && _longest(rows, i) <= 24 ? const IntrinsicColumnWidth() : const FlexColumnWidth(),
    };
    final line = BorderSide(color: styles.border);

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.fromBorderSide(line)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Table(
            columnWidths: widths,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(horizontalInside: line, verticalInside: line),
            children: [
              for (final cells in rows)
                TableRow(
                  decoration: BoxDecoration(color: styles.cell),
                  children: [
                    for (var i = 0; i < columns; i++)
                      i < cells.length ? _InfoCell(cell: cells[i], styles: styles, onTapUrl: onTapUrl) : const SizedBox.shrink(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  static int _longest(List<List<dom.Element>> rows, int column) => rows
      .where((r) => column < r.length)
      .map((r) => r[column].text.trim().length)
      .fold(0, (longest, length) => length > longest ? length : longest);
}

class _InfoCell extends StatefulWidget {
  const _InfoCell({required this.cell, required this.styles, this.onTapUrl});

  final dom.Element cell;
  final InfoContentStyles styles;
  final Future<bool> Function(String url)? onTapUrl;

  @override
  State<_InfoCell> createState() => _InfoCellState();
}

class _InfoCellState extends State<_InfoCell> {
  final _recognizers = <TapGestureRecognizer>[];

  @override
  void dispose() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();

    final styles = widget.styles;
    final cell = widget.cell;
    var style = cell.localName == 'th' ? styles.bold : styles.body;
    if (cell.classes.contains('accent')) style = style.copyWith(color: styles.accent);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text.rich(TextSpan(style: style, children: _spans(cell, style)), softWrap: true),
    );
  }

  List<InlineSpan> _spans(dom.Node node, TextStyle style) {
    final spans = <InlineSpan>[];
    var firstBlock = true;
    for (final child in node.nodes) {
      if (child is dom.Text) {
        spans.add(TextSpan(text: child.text));
      } else if (child is dom.Element) {
        switch (child.localName) {
          case 'br':
            spans.add(const TextSpan(text: '\n'));
          case 'strong' || 'b':
            spans.add(TextSpan(style: widget.styles.bold.copyWith(color: style.color), children: _spans(child, style)));
          case 'em' || 'i':
            spans.add(TextSpan(style: const TextStyle(fontStyle: FontStyle.italic), children: _spans(child, style)));
          case 'a':
            spans.add(_link(child, style));
          case 'p' || 'li' || 'div':
            if (!firstBlock) spans.add(const TextSpan(text: '\n'));
            firstBlock = false;
            spans.addAll(_spans(child, style));
          default:
            spans.addAll(_spans(child, style));
        }
      }
    }
    return spans;
  }

  InlineSpan _link(dom.Element link, TextStyle style) {
    final url = link.attributes['href'];
    final onTap = widget.onTapUrl;
    TapGestureRecognizer? recognizer;
    if (url != null && onTap != null) {
      recognizer = TapGestureRecognizer()..onTap = () => onTap(url);
      _recognizers.add(recognizer);
    }
    return TextSpan(
      style: TextStyle(color: widget.styles.accent, decoration: TextDecoration.underline),
      recognizer: recognizer,
      children: _spans(link, style),
    );
  }
}
