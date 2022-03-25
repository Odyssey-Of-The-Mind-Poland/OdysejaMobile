import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/injectable.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/app/router.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<CityDataBloc>()..add(const FetchCityData()), lazy: false),
        BlocProvider(create: (context) => getIt<UpdateFavouritesBloc>()),
      ],
      child: BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
        listener: (context, state) {
          if (state is UpdateFavouritesError) {
            showSnackBar(
              context: _scaffoldKey.currentContext ?? context,
              text: state.failure.errorMessage,
            );
          }
        },
        child: AutoTabsScaffold(
            key: _scaffoldKey,
            routes: const [
              HomeScreen(),
              InfoRouter(),
              ScheduleRouter(),
              FavouritesScreen(),
            ],
            homeIndex: 0,
            bottomNavigationBuilder: (_, tabsRouter) {
              // TODO Write custom bottomBar
              return DotNavigationBar(
                selectedItemColor: AppColors.primaryOrange,
                unselectedItemColor: AppColors.darkestGrey,
                enableFloatingNavBar: false,
                enablePaddingAnimation: false,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  DotNavigationBarItem(icon: const Icon(OotmIcons.home)),
                  DotNavigationBarItem(icon: const Icon(OotmIcons.info)),
                  DotNavigationBarItem(icon: const Icon(OotmIcons.schedule)),
                  DotNavigationBarItem(icon: const Icon(OotmIcons.favEmpty)),
                ],
              );
            }),
      ),
    );
  }
}
