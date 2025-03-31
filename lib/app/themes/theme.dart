import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme_extensions.dart';

export 'theme_extensions_widgets.dart';
export 'theme_extensions.dart';
export 'theme_dark.dart';
export 'theme_light.dart';
export 'theme_common.dart';

/// Requires providing [AppTypography], [AppColors], [AppStyling],
extension ThemeDataExtention on ThemeData {
  AppTypography get t => extension<AppTypography>()!;
  AppColors get c => extension<AppColors>()!;
  AppStyling get s => extension<AppStyling>()!;
}
