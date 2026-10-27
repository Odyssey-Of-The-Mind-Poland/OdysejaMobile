import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';

import 'package:odyssey_mobile/config/ootm_icons.dart';
class SearchResultListTile extends StatelessWidget {
  const SearchResultListTile(
      {super.key, required this.onTap, required this.performance, required this.searchPhrase});
  final VoidCallback onTap;
  final Performance performance;
  final String searchPhrase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;

    return InkWell(
      onTap: onTap,
      highlightColor: theme.extension<OotmMainButtonTheme>()?.tertiaryHighlight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: _richTextContent(
                      searchPhrase,
                      performance.team,
                      base: theme.t.bodyMediumRegular!,
                      highlight: theme.t.bodyMediumBold!.copyWith(color: common.primaryColor),
                    ),
                  ),
                  Text(
                    CohortHelper.fromPerformance(performance).format(),
                    style: theme.t.bodySmallRegular?.copyWith(color: common.textLighterColor),
                  ),
                ],
              ),
            ),
            Icon(OotmIcons.chevronRight, size: 22, color: common.textLighterColor),
          ],
        ),
      ),
    );
  }
}

/// Team name with every occurrence of the (lower case) [phrase] highlighted.
TextSpan _richTextContent(
  String phrase,
  String performanceTeam, {
  required TextStyle base,
  required TextStyle highlight,
}) {
  final List<TextSpan> textSpans = [];
  final String lowerCasePfTeam = performanceTeam.toLowerCase();

  int start = 0;
  int index = phrase.isEmpty ? -1 : lowerCasePfTeam.indexOf(phrase);
  final int length = phrase.length;

  while (index >= 0) {
    final int indexOffset = index + length;

    textSpans.add(TextSpan(text: performanceTeam.substring(start, index)));
    textSpans.add(TextSpan(text: performanceTeam.substring(index, indexOffset), style: highlight));
    start = indexOffset;
    index = lowerCasePfTeam.indexOf(phrase, indexOffset);
  }
  textSpans.add(TextSpan(text: performanceTeam.substring(start)));
  return TextSpan(style: base, children: textSpans);
}
