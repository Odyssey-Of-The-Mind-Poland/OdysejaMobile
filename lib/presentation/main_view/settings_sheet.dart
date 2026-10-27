import 'package:flutter/material.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/menu_item.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/theme_mode_sheet.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

/// Opens the settings sheet of the home screen.
Future<void> showSettingsSheet(BuildContext context) => showOotmBottomSheet<void>(
      context: context,
      routeName: 'SettingsSheet',
      child: SettingsSheet(onAppearance: () => showThemeModeSheet(context)),
    );

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({required this.onAppearance, super.key});

  /// Called after the sheet closes, to open the appearance choice.
  final VoidCallback onAppearance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        const OotmBottomSheetHeader(text: AppStrings.settingsTitle),
        MenuItem(
          title: AppStrings.themeModeTitle,
          icon: OotmIcons.moon,
          onTap: () {
            Navigator.of(context).pop();
            onAppearance();
          },
        ),
      ],
    );
  }
}
