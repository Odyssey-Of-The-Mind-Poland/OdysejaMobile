import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

// TODO: find a way to limit bottom sheet height.
/// A BottomSheet with more refined, draggable interations.
/// Leaves empty space at the bottom of the sheet
/// if content's height is less then viewport's.
Future<T?> showOotmScrollableBottomSheet<T>({
  required BuildContext context,
  required List<Widget> content,
  double initialSize = 0.5,
  double maxChildSize = 1.0,
  String? routeName,
  bool useRootNavigator = false,
}) =>
    showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      routeSettings: RouteSettings(name: routeName),
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _DraggableBuilder(
        initialSize: initialSize,
        maxChildSize: maxChildSize,
        builder: (context, scrollController) => _BottomSheetBody(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: content,
            ),
          ),
        ),
      ),
    );

Future<T?> showOotmBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  String? routeName,
  bool useRootNavigator = false,
}) =>
    showModalBottomSheet(
      useRootNavigator: useRootNavigator,
      context: context,
      routeSettings: RouteSettings(name: routeName),
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BottomSheetBody(
        child: SingleChildScrollView(child: child),
      ),
    );

class _BottomSheetBody extends StatelessWidget {
  const _BottomSheetBody({
    required this.child,
  });

  final Widget child;

  static const Color _borderFallback = Color(0xFF808489); //grey400

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OotmBottomSheetTheme>();
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Container(
            height: 6,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: theme?.handleColor,
            ),
          ),
          Flexible(
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(width: 2, color: theme?.borderColor ?? _borderFallback),
              ),
              color: theme?.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DraggableBuilder extends StatefulWidget {
  const _DraggableBuilder(
      {required this.initialSize, required this.maxChildSize, required this.builder});

  final double initialSize;
  final double maxChildSize;
  final Widget Function(BuildContext, ScrollController) builder;
  @override
  State<_DraggableBuilder> createState() => __DraggableBuilderState();
}

class __DraggableBuilderState extends State<_DraggableBuilder> {
  late final DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
    // _controller.addListener(_listener);
  }

  // void _listener() => print('size: ${_controller.size}, pixels: ${_controller.pixels}');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      expand: false,
      snap: false,
      initialChildSize: widget.initialSize,
      maxChildSize: widget.maxChildSize,
      builder: widget.builder,
    );
  }
}

class OotmBottomSheetHeader extends StatelessWidget {
  const OotmBottomSheetHeader({required this.text, super.key});

  final String text;

  static const _defaultDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OotmBottomSheetTheme>();
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).t.h3),
        IconButton(
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: WidgetStatePropertyAll(Size(32, 32)),
            padding: WidgetStatePropertyAll(EdgeInsets.all(4)),
            animationDuration: _defaultDuration,
            backgroundColor: WidgetStatePropertyAll(theme?.closeButtonBackground),
            foregroundColor: WidgetStatePropertyAll(theme?.closeButtonForeground),
            overlayColor: WidgetStatePropertyAll(theme?.closeButtonHighlight),
          ),
          onPressed: Navigator.of(context).pop,
          icon: Icon(OotmIcons.close),
        ),
      ],
    );
  }
}
