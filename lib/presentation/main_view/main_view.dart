import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/ootm_icons.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/injectable.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:odyssey_mobile/presentation/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/router.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart';
import '../favourites_screen/bloc/favourites_bloc.dart';
import 'bloc/city_bloc.dart';
import 'city_select_button.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

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
          create: (context) => CityBloc(sl())..add(FetchCities()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CityDataBloc(sl())..add(const FetchCityData(0)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              ScheduleSearchBloc(context.read<CityDataBloc>()),
        ),
        BlocProvider(
          create: (context) => UpdateFavouritesBloc(sl()),
        ),
        BlocProvider(
          create: (context) => FavouritesBloc(
            context.read<CityDataBloc>(),
            context.read<UpdateFavouritesBloc>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
            listener: (context, state) {
              if (state is UpdateFavouritesError) {
                showSnackBar(
                  context: _scaffoldKey.currentContext ?? context,
                  text: state.failure.errorMessage,
                );
              }
            },
          ),
          BlocListener<UpdateBloc, UpdateState>(
            listener: (context, state) {
              if (state is UpdateFinished) {
                context.read<CityDataBloc>().add(const FetchCityData(0));
              }
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AutoTabsScaffold(
                  key: _scaffoldKey,
                  routes: const [
                    HomeRoute(),
                    InfoRoutes(),
                    ScheduleRoutes(),
                    FavouritesRoute(),
                  ],
                  homeIndex: 0,
                  bottomNavigationBuilder: (_, tabsRouter) {
                    return SizedBox(
                      child: DotNavigationBar(
                        selectedItemColor: AppColors.primaryOrange,
                        unselectedItemColor: AppColors.darkestGrey,
                        enableFloatingNavBar: false,
                        enablePaddingAnimation: false,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: tabsRouter.setActiveIndex,
                        items: [
                          DotNavigationBarItem(
                              icon: const Icon(OotmIcons.home)),
                          DotNavigationBarItem(
                              icon: const Icon(OotmIcons.info)),
                          DotNavigationBarItem(
                              icon: const Icon(OotmIcons.schedule)),
                          DotNavigationBarItem(
                              icon: const Icon(Icons.favorite_outline)),
                        ],
                      ),
                    );
                  },
                ),
                // Floating Button Relative to Bottom Navigation Bar
                CitySelectButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}


