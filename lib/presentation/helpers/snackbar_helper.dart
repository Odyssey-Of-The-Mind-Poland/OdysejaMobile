import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
  required BuildContext context,
  required String text,
  Color color = AppColors.primaryOrange,
  Duration duration = const Duration(seconds: 2),
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text,
            style: const TextStyle(color: AppColors.pureWhite), textAlign: TextAlign.center),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        margin: const EdgeInsets.all(16),
      ),
    );
