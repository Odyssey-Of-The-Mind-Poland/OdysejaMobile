import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
  required BuildContext context,
  required String text,
  SnackBarType type = SnackBarType.info,
  IconData? customIconData,
  Duration duration = const Duration(seconds: 2),
}) {
  final borderColor = type.borderColor(context);
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        spacing: 12,
        children: [
          Icon(
            customIconData ?? type.iconData,
            color: Theme.of(context).c.universal.grey.color100,
          ),
          Text(
            text,
            style: Theme.of(context)
                .t
                .bodyMediumBold
                ?.copyWith(color: Theme.of(context).c.universal.grey.color100),
          ),
        ],
      ),
      backgroundColor: type.backgroundColor(context),
      shape: RoundedRectangleBorder(
        side: borderColor != null ? BorderSide(color: borderColor, width: 2) : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 0,
    ),
  );
}

enum SnackBarType {
  info(OotmIcons.info),
  error(OotmIcons.close),
  success(OotmIcons.circleCheck);

  final IconData iconData;

  const SnackBarType(this.iconData);

  Color? backgroundColor(BuildContext context) {
    switch (this) {
      case SnackBarType.info:
        return Theme.of(context).c.universal.blue.color300?.withValues(alpha: 0.98);
      case SnackBarType.error:
        return Theme.of(context).c.universal.red.color300?.withValues(alpha: 0.98);
      case SnackBarType.success:
        return Theme.of(context).c.universal.green.color500?.withValues(alpha: 0.98);
    }
  }

  Color? borderColor(BuildContext context) {
    switch (this) {
      case SnackBarType.info:
        return Theme.of(context).c.universal.blue.color200?.withValues(alpha: 0.24);
      case SnackBarType.error:
        return Theme.of(context).c.universal.red.color200?.withValues(alpha: 0.24);
      case SnackBarType.success:
        return Theme.of(context).c.universal.green.color200?.withValues(alpha: 0.24);
    }
  }
}
