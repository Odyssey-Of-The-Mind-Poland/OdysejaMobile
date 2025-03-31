import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme_extensions_widgets.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  TopBar({
    super.key,
    this.title,
    this.titleWidget,
    this.bottom,
    this.leading,
    this.actions,
  })  : preferredSize = Size.fromHeight(_toolbarHeight + (bottom?.preferredSize.height ?? 0)),
        assert(title != null || titleWidget != null);

  factory TopBar.backAction({
    String? title,
    Widget? titleWidget,
    PreferredSizeWidget? bottom,
    List<Widget>? actions,
  }) =>
      TopBar(
        title: title,
        titleWidget: titleWidget,
        actions: actions,
        bottom: bottom,
        leading: const BackAction(),
      );

  static const _toolbarHeight = 76.0;

  final PreferredSizeWidget? bottom;
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final t = title;
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 60,
      titleSpacing: 16,
      toolbarHeight: _toolbarHeight,
      leading: leading != null
          ? Center(child: Padding(padding: EdgeInsets.only(left: 16), child: leading))
          : null,
      actions: actions,
      bottom: bottom,
      title: t != null ? Text(t) : titleWidget,
    );
  }
}

class BackAction extends StatelessWidget {
  const BackAction({super.key});

  @override
  Widget build(BuildContext context) {
    return TopBarAction(
      iconData: OotmIcons.arrowLeft,
      onPressed: Navigator.of(context).pop,
    );
  }
}

class TopBarAction extends StatelessWidget {
  const TopBarAction({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.foregroundColor,
    this.foregroundColorPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderColorPressed,
  });

  final IconData iconData;
  final void Function() onPressed;

  final Color? foregroundColor;
  final Color? foregroundColorPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? borderColorPressed;

  static const _defaultDuration = Duration(milliseconds: 200);
  static const _borderColorFallback = Color(0xFF3C3E40);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<TopBarTheme>();
    return SizedBox(
      child: IconButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStatePropertyAll(Size(44, 44)),
          animationDuration: _defaultDuration,
          side: WidgetStateProperty.fromMap({
            WidgetState.pressed: BorderSide(
              width: 2,
              color: theme?.actionBorderPressed ?? _borderColorFallback,
            ),
            WidgetState.any: BorderSide(
              width: 2,
              color: theme?.actionBorder ?? _borderColorFallback,
            ),
          }),
          backgroundColor: WidgetStatePropertyAll(backgroundColor ?? theme?.actionBackground),
          foregroundColor: WidgetStateProperty.fromMap({
            WidgetState.pressed: foregroundColorPressed ?? theme?.actionForegroundPressed,
            WidgetState.any: foregroundColor ?? theme?.actionForeground,
          }),
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: onPressed,
        icon: Icon(iconData, size: 22),
      ),
    );
  }
}
