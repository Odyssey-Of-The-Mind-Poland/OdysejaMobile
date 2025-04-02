import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/features/update_data/app_update_recommended_bottom_sheet.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';
import 'package:odyssey_mobile/widgets/snackbar.dart';
import 'package:odyssey_mobile/features/update_data/bloc/update_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart';
import 'package:odyssey_mobile/widgets/ootm_navigation_bar.dart';
import '../presentation/favourites_screen/bloc/favourites_bloc.dart';
import '../presentation/main_view/bloc/city_bloc.dart';
// import 'city_select_button.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () => context.read<UpdateBloc>().add(CheckForUpdatesEvent()),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _shouldPresentAppUpdateBottomSheet());
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  Future<void> _shouldPresentAppUpdateBottomSheet() async {
    final state = context.read<UpdateBloc>().state;
    if (state is! UpdateFinished) {
      return;
    }
    if (state.isUpdateRecommended) {
      final result = await showOotmBottomSheet<bool>(
        context: context,
        child: AppUpdateRecommendedBottomSheet(),
      );
      if (!mounted) return;

      if (result == null) {
        context.read<UpdateBloc>().add(SkipAppUpdateEvent());
      } else if (!result) {
        showSnackBar(
          context: context,
          text: AppStrings.urlLauncherFailureMessage,
          type: SnackBarType.error,
        );
      }
    }
  }

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
          create: (context) => ScheduleSearchBloc(context.read<CityDataBloc>()),
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
        child: AutoTabsScaffold(
          key: _scaffoldKey,
          routes: const [
            HomeRoute(),
            InfoRoutes(),
            ScheduleRoutes(),
            FavouritesRoute(),
          ],
          homeIndex: 0,
          // TODO: Add height compensation to all the screens before enabling!
          extendBody: false,
          // FIXME: Add a mechanism to hide the button if there is only one city.
          // floatingActionButton: CitySelectButton(),
          bottomNavigationBuilder: (_, tabsRouter) {
            return OotmNavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (index) {
                if (tabsRouter.activeIndex == index) {
                  final nestedRouter = tabsRouter.stackRouterOfIndex(index);
                  if (nestedRouter != null && nestedRouter.canPop()) {
                    nestedRouter.pop();
                  }
                  return;
                }
                tabsRouter.setActiveIndex(index);
              },
              // TODO: Requires extendBody: true
              blurEnabled: false,
              destinations: [
                Destination(
                  iconData: OotmIcons.home,
                  label: AppStrings.homeScreenNavigationLabel,
                ),
                Destination(
                  iconData: OotmIcons.info,
                  label: AppStrings.infoScreenNavigationLabel,
                ),
                Destination(
                  iconData: OotmIcons.schedule,
                  label: AppStrings.scheduleScreenNavigationLabel,
                ),
                Destination(
                  iconData: OotmIcons.favourites,
                  label: AppStrings.favScreenNavigationLabel,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
