import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/themes/theme_extensions.dart';
import 'package:odyssey_mobile/core/themes/theme_extensions_widgets.dart';

export 'theme_extensions_widgets.dart';
export 'theme_extensions.dart';
export 'theme_dark.dart';
export 'theme_light.dart';
export 'theme_common.dart';

/// Requires providing [AppTypography], [AppColors], [AppStyling],
/// and [OotmNavigationBarThemeData].
extension ThemeDataExtention on ThemeData {
  AppTypography get t => extension<AppTypography>()!;
  AppColors get c => extension<AppColors>()!;
  AppStyling get s => extension<AppStyling>()!;
}
