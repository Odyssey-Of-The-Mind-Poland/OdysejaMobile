import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';

import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';

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

  // decoration: decorationTween.animate(_controller),
  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      position: DecorationPosition.foreground,
      decoration: decorationTween.animate(_controller),
      child: PerformanceCard(performance: widget.performance, secretWidth: widget.secretWidth),
    );
  }

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        border: Border.all(color: AppColors.primaryOrange, width: 1)),
    end: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        border: Border.all(color: AppColors.primaryOrange, width: 3)),
  );
}
