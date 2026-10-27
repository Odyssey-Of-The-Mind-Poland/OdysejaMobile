import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_filter_sheet.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_view_cubit.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';

@RoutePage()
class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, CityDataState>(
      buildWhen: (p, c) =>
          c is FavouritesSuccess && p is FavouritesSuccess && p.days.length != c.days.length ||
          p is CityDataLoading,
      builder: (context, state) {
        if (state is FavouritesSuccess) {
          return ScheduleLayout(
            days: state.days,
            performanceGroups: state.performanceGroups,
            title: AppStrings.favScreenTitle,
            inFavourites: true,
            actions: [
              BlocBuilder<FavouritesViewCubit, FavouritesView>(
                builder: (context, view) => TopBarAction(
                  iconData: OotmIcons.filters,
                  onPressed: () => showFavouritesFilterSheet(context),
                ),
              ),
            ],
            emptyWidget: const FavouritesEmpty(),
          );
        } else if (state is CityDataError) {
          return ErrorBody(state.failure);
        }
        return const Loader();
      },
    );
  }
}

class FavouritesEmpty extends StatelessWidget {
  const FavouritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.extension<OotmCommonTheme>()?.textLighterColor;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.click, style: theme.t.bodyLargeRegular?.copyWith(color: muted)),
          const SizedBox(height: 4),
          Text(AppStrings.addToFavsLabel, style: theme.t.bodyLargeBold),
          Text(
            AppStrings.emptyFavouritesCaption,
            style: theme.t.bodyLargeRegular?.copyWith(color: muted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
