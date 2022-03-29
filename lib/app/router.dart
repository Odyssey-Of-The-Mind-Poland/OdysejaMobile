import 'package:auto_route/auto_route.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_screen.dart';
import 'package:odyssey_mobile/presentation/home_screen/home_screen.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_detail_screen.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_router.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_screen.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/initial_screens.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/loading_screen.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/splash_screen.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/welcome_screen.dart';
import 'package:odyssey_mobile/presentation/main_view/main_view.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_detail_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_router.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_search_result_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_search_screen.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitialScreen, initial: true, maintainState: false, children: [
      AutoRoute(page: SplashScreen, initial: true),
      AutoRoute(page: WelcomeScreen),
      AutoRoute(page: LoadingScreen),
    ]),
    AutoRoute(page: MainView, children: [
      AutoRoute(page: HomeScreen, initial: true),
      AutoRoute(page: InfoRouter, children: [
        AutoRoute(page: InfoScreen, initial: true),
        AutoRoute(page: InfoDetailScreen),
      ]),
      AutoRoute(page: ScheduleRouter, children: [
        AutoRoute(page: ScheduleScreen, initial: true),
        AutoRoute(page: ScheduleDetailScreen),
        CustomRoute(
            page: ScheduleSearchScreen,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 330,
            maintainState: true),
        AutoRoute(page: ScheduleSearchResultScreen, maintainState: false),
      ]),
      AutoRoute(page: FavouritesScreen),
    ]),
  ],
)
class $AppRouter {}
