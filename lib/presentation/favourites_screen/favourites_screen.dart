import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
import 'package:odyssey_mobile/presentation/core/error_body.dart';
import 'package:odyssey_mobile/presentation/core/loader.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesBloc(
        context.read<CityDataBloc>(),
        context.read<UpdateFavouritesBloc>(),
      ),
      child: BlocBuilder<FavouritesBloc, CityDataState>(
        buildWhen: (p, c) =>
            c is FavouritesSuccess && p is FavouritesSuccess && p.days.length != c.days.length ||
            p is CityDataLoading,
        builder: (context, state) {
          if (state is FavouritesSuccess) {
            return ScheduleLayout(
              centerTitle: false,
              days: state.days,
              performanceGroups: state.performanceGroups,
              title: AppStrings.favScreenTitle,
              inFavourites: true,
              emptyWidget: const FavouritesEmpty(),
            );
          } else if (state is CityDataError) {
            return ErrorBody(state.failure);
          }
          return const Loader();
        },
      ),
    );
  }
}

class FavouritesEmpty extends StatelessWidget {
  const FavouritesEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(AppStrings.click, style: AppTextStyles.bodyText2),
          SizedBox(height: 4),
          Text(AppStrings.addToFavsLabel, style: AppTextStyles.button),
          Text(AppStrings.emptyFavouritesCaption, style: AppTextStyles.bodyText2),
        ],
      ),
    );
  }
}
