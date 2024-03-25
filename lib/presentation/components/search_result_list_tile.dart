import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';

class SearchResultListTile extends StatelessWidget {
  const SearchResultListTile(
      {Key? key, required this.onTap, required this.performance, required this.searchPhrase})
      : super(key: key);
  final VoidCallback onTap;
  final Performance performance;
  final String searchPhrase;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: RichText(text: _richTextContent(searchPhrase, performance.team)),
      subtitle: Text(
        CohortHelper(performance).string,
        style: AppTextStyles.bodyText1,
      ),
    );
  }
}

TextSpan _richTextContent(String phrase, String performanceTeam) {
  final List<TextSpan> textSpans = [];

  // phrase is already lower case
  final String lowerCasePfTeam = performanceTeam.toLowerCase();

  int start = 0;
  // try to find first occurance
  int index = lowerCasePfTeam.indexOf(phrase);
  final int length = phrase.length;

  // while there is an occurance
  while (index >= 0) {
    final int indexOffset = index + length;

    textSpans.add(TextSpan(text: performanceTeam.substring(start, index), style: AppTextStyles.h4));
    textSpans.add(TextSpan(
      text: performanceTeam.substring(index, indexOffset),
      style: AppTextStyles.h4orange,
    ));
    start = indexOffset;
    index = lowerCasePfTeam.indexOf(phrase, indexOffset);
  }
  textSpans.add(TextSpan(text: performanceTeam.substring(start)));
  return TextSpan(style: AppTextStyles.h4, children: textSpans);
}
