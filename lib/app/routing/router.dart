import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/features/update_data/app_reinstall_required_screen.dart';
import 'package:odyssey_mobile/features/update_data/app_update_required_screen.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_screen.dart';
import 'package:odyssey_mobile/presentation/home_screen/home_screen.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_detail_screen.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_screens.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_screen.dart';
import 'package:odyssey_mobile/features/update_data/loading_screen.dart';
import 'package:odyssey_mobile/app/main_view.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_detail_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_screens.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_search_result_screen.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|View,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoadingRoute.page, path: '/'),
    AutoRoute(page: AppUpdateRequiredRoute.page),
    AutoRoute(page: AppReinstallRequiredRoute.page),
    AutoRoute(page: MainRoute.page, children: [
      AutoRoute(page: HomeRoute.page, path: ''),
      AutoRoute(page: InfoRoutes.page, children: [
        AutoRoute(page: InfoRoute.page, path: ''),
        AutoRoute(page: InfoDetailRoute.page),
      ]),
      AutoRoute(page: ScheduleRoutes.page, children: [
        AutoRoute(page: ScheduleRoute.page, path: ''),
        AutoRoute(page: ScheduleDetailRoute.page),
        CustomRoute(
            page: ScheduleSearchRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 330,
            maintainState: true),
        AutoRoute(page: ScheduleSearchResultRoute.page, maintainState: false),
      ]),
      AutoRoute(page: FavouritesRoute.page),
    ]),
  ];
}
