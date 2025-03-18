import 'package:flutter/material.dart';

/// Taken from [NavigationBar] implementation.
class AnimationStatusBuilder extends StatusTransitionWidget {
  /// Creates a widget that rebuilds when the animation changes status.
  const AnimationStatusBuilder({
    super.key,
    required super.animation,
    required this.builder,
    this.child,
  });

  final TransitionBuilder builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(context, child);
}
