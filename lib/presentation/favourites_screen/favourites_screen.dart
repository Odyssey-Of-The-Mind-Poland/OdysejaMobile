import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

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
            emptyWidget: const FavouritesEmpty(),
            centerTitle: false,
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
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.click, style: AppTextStyles.bodyText2),
          SizedBox(height: 4),
          Text(AppStrings.addToFavsLabel, style: AppTextStyles.button),
          Text(AppStrings.emptyFavouritesCaption,
              style: AppTextStyles.bodyText2, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
