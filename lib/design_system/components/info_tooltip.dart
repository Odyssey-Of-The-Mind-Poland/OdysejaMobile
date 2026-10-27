import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Blue speech bubble shown on tap, used next to small "i" icons to explain a label.
/// [message] may contain `**bold**` fragments.
class InfoTooltip extends StatelessWidget {
  const InfoTooltip({required this.message, required this.child, super.key});

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.c.universal.blue.color300!;
    final style = theme.t.bodySmallRegular!.copyWith(color: theme.c.universal.grey.color100);

    return Tooltip(
      richMessage: TextSpan(style: style, children: _parse(message, style)),
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      showDuration: const Duration(seconds: 4),
      constraints: const BoxConstraints(maxWidth: 240),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }

  static List<InlineSpan> _parse(String message, TextStyle base) {
    final parts = message.split('**');
    return [
      for (var i = 0; i < parts.length; i++)
        if (parts[i].isNotEmpty)
          TextSpan(
            text: parts[i],
            style: i.isOdd ? base.copyWith(fontWeight: FontWeight.w500) : null,
          ),
    ];
  }
}
