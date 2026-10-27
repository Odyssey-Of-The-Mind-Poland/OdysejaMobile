import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes/theme_mode_cubit.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/menu_item.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

/// Opens the "Wygląd aplikacji" sheet bound to the app-wide [ThemeModeCubit].
Future<void> showThemeModeSheet(BuildContext context) {
  final cubit = context.read<ThemeModeCubit>();
  return showOotmBottomSheet<void>(
    context: context,
    routeName: 'ThemeModeSheet',
    child: BlocProvider.value(value: cubit, child: const ThemeModeSheet()),
  );
}

/// Light / dark / follow-the-system choice.
class ThemeModeSheet extends StatelessWidget {
  const ThemeModeSheet({super.key});

  static const _options = [
    (ThemeMode.light, AppStrings.themeModeLight, Icons.light_mode_outlined),
    (ThemeMode.dark, AppStrings.themeModeDark, OotmIcons.moon),
    (ThemeMode.system, AppStrings.themeModeSystem, Icons.smartphone_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final current = context.watch<ThemeModeCubit>().state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        const OotmBottomSheetHeader(text: AppStrings.themeModeTitle),
        for (final (mode, label, icon) in _options)
          MenuItem(
            title: label,
            icon: icon,
            selected: mode == current,
            onTap: () => context.read<ThemeModeCubit>().setMode(mode),
          ),
      ],
    );
  }
}
