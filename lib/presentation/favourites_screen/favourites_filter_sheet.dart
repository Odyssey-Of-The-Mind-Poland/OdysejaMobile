import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/design_system/components/filter_item.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_view_cubit.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/widgets/main_button.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

/// Opens the favourites filter sheet; it edits the [FavouritesViewCubit] in place.
Future<void> showFavouritesFilterSheet(BuildContext context) {
  final cubit = context.read<FavouritesViewCubit>();
  final state = context.read<CityDataBloc>().state;
  final stages = state is CityDataSuccess ? state.cityData.stages : const <ScheduleCategoryEntity>[];
  final problems = state is CityDataSuccess ? state.problems : const <ScheduleCategoryEntity>[];
  final divisions = state is CityDataSuccess ? state.divisions : defaultDivisions;

  return showOotmBottomSheet<void>(
    context: context,
    routeName: 'FavouritesFilterSheet',
    child: BlocProvider.value(
      value: cubit,
      child: FavouritesFilterSheet(stages: stages, problems: problems, divisions: divisions),
    ),
  );
}

class FavouritesFilterSheet extends StatelessWidget {
  const FavouritesFilterSheet({
    required this.stages,
    required this.problems,
    this.divisions = defaultDivisions,
    super.key,
  });

  final List<ScheduleCategoryEntity> stages;
  final List<ScheduleCategoryEntity> problems;
  final List<DivisionEntity> divisions;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavouritesViewCubit>();

    return BlocBuilder<FavouritesViewCubit, FavouritesView>(
      builder: (context, view) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            const OotmBottomSheetHeader(text: AppStrings.favFilterTitle),
            _Section(
              title: AppStrings.favFilterDisplayAs,
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: MainButton.tertiary(
                      label: AppStrings.favFilterList,
                      isSelected: view.mode == FavouritesDisplayMode.list,
                      onPressed: () => cubit.setMode(FavouritesDisplayMode.list),
                    ),
                  ),
                  Expanded(
                    child: MainButton.tertiary(
                      label: AppStrings.favFilterTimeline,
                      isSelected: view.mode == FavouritesDisplayMode.timeline,
                      onPressed: () => cubit.setMode(FavouritesDisplayMode.timeline),
                    ),
                  ),
                ],
              ),
            ),
            if (stages.isNotEmpty)
              _ChipSection(
                title: AppStrings.favFilterStage,
                entities: stages,
                selected: view.stages,
                onToggle: cubit.toggleStage,
              ),
            if (problems.isNotEmpty)
              _ChipSection(
                title: AppStrings.favFilterProblem,
                entities: problems,
                selected: view.problems,
                onToggle: cubit.toggleProblem,
              ),
            _ChipSection(
              title: AppStrings.favFilterAge,
              entities: divisions,
              selected: view.ages,
              onToggle: cubit.toggleAge,
            ),
            MainButton.secondary(
              label: AppStrings.favFilterClear,
              iconData: OotmIcons.close,
              onPressed: cubit.clearFilters,
            ),
          ],
        );
      },
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(title, style: Theme.of(context).t.bodyMediumBold),
        child,
      ],
    );
  }
}

class _ChipSection extends StatelessWidget {
  const _ChipSection({
    required this.title,
    required this.entities,
    required this.selected,
    required this.onToggle,
  });

  final String title;
  final List<ScheduleCategoryEntity> entities;
  final Set<int> selected;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: title,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final entity in entities)
            FilterItem(
              label: entity.symbol,
              active: selected.contains(entity.number),
              onPressed: () => onToggle(entity.number),
            ),
        ],
      ),
    );
  }
}
