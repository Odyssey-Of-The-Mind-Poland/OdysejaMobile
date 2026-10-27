import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';

/// A [PerformanceCard] whose outline pulses to point the user at it (search result).
class HighlightedPerformanceCard extends StatefulWidget {
  const HighlightedPerformanceCard({
    super.key,
    required this.performance,
    required this.secretWidth,
  });
  final Performance performance;
  final double secretWidth;

  @override
  State<HighlightedPerformanceCard> createState() => _HighlightedPerformanceCardState();
}

class _HighlightedPerformanceCardState extends State<HighlightedPerformanceCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<OotmCommonTheme>()!.primaryColor!;
    BoxDecoration outline(double width) => BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: width),
        );

    return DecoratedBoxTransition(
      position: DecorationPosition.foreground,
      decoration: DecorationTween(begin: outline(2), end: outline(4)).animate(_controller),
      child: PerformanceCard(performance: widget.performance, secretWidth: widget.secretWidth),
    );
  }
}
