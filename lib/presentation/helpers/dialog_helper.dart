import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

Future<T?> showModalDialog<T>({required BuildContext context, required Widget widget}) =>
    showDialog<T>(
      context: context,
      builder: (_) => widget,
      barrierColor: AppColors.scrimGrey,
      useRootNavigator: true,
      barrierDismissible: true,
    );
