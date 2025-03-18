import 'package:flutter/material.dart';

/// Taken from [NavigationBar] implementation.
class SelectableAnimatedBuilder extends StatefulWidget {
  /// Plays animation forward if [isSelected] equals true, reverses it if false.
  /// Can be used in any widget that animates multiple widgets for different states,
  /// E.g. [OotmNavigationBar].
  const SelectableAnimatedBuilder({
    super.key,
    required this.isSelected,
    this.duration = const Duration(milliseconds: 200),
    this.alwaysDoFullAnimation = false,
    required this.builder,
  });

  final bool isSelected;
  final Duration duration;
  final bool alwaysDoFullAnimation;
  final Widget Function(BuildContext, Animation<double>) builder;

  @override
  State<SelectableAnimatedBuilder> createState() => _SelectableAnimatedBuilderState();
}

class _SelectableAnimatedBuilderState extends State<SelectableAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = widget.duration;
    _controller.value = widget.isSelected ? 1.0 : 0.0;
  }

  @override
  void didUpdateWidget(SelectableAnimatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward(from: widget.alwaysDoFullAnimation ? 0 : null);
      } else {
        _controller.reverse(from: widget.alwaysDoFullAnimation ? 1 : null);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}
