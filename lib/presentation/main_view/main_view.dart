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
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart';

@RoutePage()
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
        BlocProvider(
            create: (context) => getIt<ScheduleSearchBloc>(param1: context.read<CityDataBloc>())),
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
                context.read<CityDataBloc>().add(const FetchCityData());
              }
            },
          ),
        ],
        child: Center(
          child: SizedBox(
            width: 600,
            child: AutoTabsScaffold(
                key: _scaffoldKey,
                routes: const [
                  HomeRoute(),
                  InfoRoutes(),
                  ScheduleRoutes(),
                  FavouritesRoute(),
                ],
                homeIndex: 0,
                bottomNavigationBuilder: (_, tabsRouter) {
                  return DotNavigationBar(
                    selectedItemColor: AppColors.primaryOrange,
                    unselectedItemColor: AppColors.darkestGrey,
                    enableFloatingNavBar: false,
                    enablePaddingAnimation: false,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    items: const [
                      DotNavigationBarItem(icon: Icon(OotmIcons.home)),
                      DotNavigationBarItem(icon: Icon(OotmIcons.info)),
                      DotNavigationBarItem(icon: Icon(OotmIcons.schedule)),
                      DotNavigationBarItem(icon: Icon(Icons.favorite_outline)),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
