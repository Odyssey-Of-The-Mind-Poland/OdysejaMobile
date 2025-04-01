import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class PerformanceBottomSheet extends StatelessWidget {
  const PerformanceBottomSheet({required this.performance, required this.bloc, super.key});

  final Performance performance;
  final UpdateFavouritesBloc bloc;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).t;
    final color = Theme.of(context).c;
    final common = Theme.of(context).extension<OotmCommonTheme>();

    final spontanousTimeWidget = _TimeWidget(
      day: performance.spontanDay,
      hour: performance.spontan,
      highlighted: false,
      type: _TimeWidgetInfoType.spontaneous,
    );

    final cohortWidget = Text(
      CohortHelper(performance).string,
      style: typography.bodyMediumRegular?.copyWith(color: common?.textLighterColor),
    );

    return BlocBuilder<UpdateFavouritesBloc, UpdateFavouritesState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(performance.team,
                style: typography.bodyLargeBold
                    ?.copyWith(color: performance.isFavourite ? color.primary.color500 : null)),
            cohortWidget,
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 16,
              children: [
                _TimeWidget(
                  day: performance.performanceDay,
                  hour: performance.performance,
                  highlighted: performance.isFavourite,
                  type: _TimeWidgetInfoType.performance,
                ),
                spontanousTimeWidget,
              ],
            ),
            const SizedBox(height: 8),
            _AddToFavouritesButton(
              inFavourites: performance.isFavourite,
              onPressed: () => bloc.add(Update(
                performance..isFavourite = !performance.isFavourite,
              )),
            ),
          ],
        );
      },
    );
  }
}

class _AddToFavouritesButton extends StatelessWidget {
  const _AddToFavouritesButton({required this.inFavourites, required this.onPressed});

  final bool inFavourites;
  final Function() onPressed;

  // TODO: move to themes and combine with MainButton themes?
  static const _height = 48.0;
  static const _padding = EdgeInsets.fromLTRB(20, 12, 24, 12);
  static const _defaultDuration = Duration(milliseconds: 200);
  static const _defaultRadius = 80.0;
  static const _fallbackBorderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OotmMainButtonTheme>();

    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(0, _height)),
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).t.bodyMediumBold?.copyWith(height: 1),
        ),
        padding: WidgetStatePropertyAll(_padding),
        animationDuration: _defaultDuration,
        side: WidgetStateProperty.fromMap(inFavourites
            ? {
                WidgetState.pressed:
                    BorderSide(width: 2, color: theme?.secondaryPressed ?? _fallbackBorderColor),
                WidgetState.any:
                    BorderSide(width: 2, color: theme?.secondaryDefault ?? _fallbackBorderColor),
              }
            : {
                WidgetState.any:
                    BorderSide(width: 2, color: theme?.primaryBorder ?? _fallbackBorderColor),
              }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_defaultRadius)),
        ),
        backgroundColor: WidgetStatePropertyAll(inFavourites ? null : theme?.primaryBackground),
        foregroundColor: WidgetStatePropertyAll(
          inFavourites ? theme?.secondaryDefault : theme?.primaryForeground,
        ),
        overlayColor: WidgetStatePropertyAll(
          inFavourites ? Colors.transparent : theme?.primaryHighlight,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: _defaultDuration,
            switchOutCurve: Curves.easeOut,
            switchInCurve: Curves.easeIn,
            child: inFavourites
                ? Icon(OotmIcons.close, key: Key('1'))
                : Icon(OotmIcons.favourites, key: Key('0')),
          ),
          AnimatedCrossFade(
            firstChild: Text(AppStrings.removeFromFavsLabel),
            secondChild: Text(AppStrings.addToFavsLabel),
            crossFadeState: inFavourites ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: _defaultDuration,
          ),
        ],
      ),
    );
  }
}

enum _TimeWidgetInfoType { performance, spontaneous }

class _TimeWidget extends StatelessWidget {
  const _TimeWidget({
    required this.day,
    required this.hour,
    required this.highlighted,
    required this.type,
  });

  final String day;
  final String hour;
  final bool highlighted;
  final _TimeWidgetInfoType type;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).c;
    final typography = Theme.of(context).t;
    final common = Theme.of(context).extension<OotmCommonTheme>();

    return _ToolTip(
      type: type,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              _formatTimeDay,
              style: typography.h2?.copyWith(color: highlighted ? colors.primary.color500 : null),
            ),
            Row(spacing: 4, children: [
              Text(
                _type,
                style: typography.bodyLargeRegular?.copyWith(color: common?.textLighterColor),
              ),
              Icon(OotmIcons.info, color: colors.universal.blue.color300, size: 14),
            ]),
          ],
        ),
      ),
    );
  }

  String get _type =>
      type == _TimeWidgetInfoType.performance ? AppStrings.performance : AppStrings.spontan;

  String get _formatTimeDay => '${StringHelper.shortDayFormat(day)} • $hour';
}

class _ToolTip extends StatelessWidget {
  const _ToolTip({required this.type, required this.child});

  final _TimeWidgetInfoType type;
  final Widget child;

  static const _defaultRadius = 12.0;
  static const _fallbackTooltipBorderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).c;
    final typography = Theme.of(context).t;

    return InkWell(
      borderRadius: BorderRadius.circular(_defaultRadius),
      onTap: () {},
      child: Tooltip(
        richMessage: _tooltipContent(typography, colors),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_defaultRadius),
          border: Border.all(
            width: 2,
            color: colors.universal.blue.color200?.withValues(alpha: 0.24) ??
                _fallbackTooltipBorderColor,
          ),
          color: colors.universal.blue.color300?.withValues(alpha: 0.98),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        triggerMode: TooltipTriggerMode.tap,
        verticalOffset: 48,
        showDuration: const Duration(seconds: 2),
        child: child,
      ),
    );
  }

  InlineSpan _tooltipContent(AppTypography typography, AppColors colors) =>
      type == _TimeWidgetInfoType.performance
          ? _tooltipFormat(
              '${AppStrings.performanceTooltip1} ',
              AppStrings.performanceTooltip2,
              ' ${AppStrings.performanceTooltip3}',
              colors: colors,
              typography: typography,
            )
          : _tooltipFormat(
              '${AppStrings.spontanTooltip1} ',
              AppStrings.spontanTooltip2,
              ' ${AppStrings.spontanTooltip3}',
              colors: colors,
              typography: typography,
            );

  static InlineSpan _tooltipFormat(
    String part1,
    String part2,
    String part3, {
    required AppTypography typography,
    required AppColors colors,
  }) =>
      TextSpan(
        text: part1,
        style: typography.bodySmallRegular?.copyWith(color: colors.universal.grey.color100),
        children: [
          TextSpan(
            text: part2,
            style: typography.bodySmallBold?.copyWith(color: colors.universal.grey.color100),
          ),
          TextSpan(text: part3),
        ],
      );
}
