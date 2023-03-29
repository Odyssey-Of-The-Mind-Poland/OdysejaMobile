// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    InitialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouritesScreen(),
      );
    },
    InfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoScreen(),
      );
    },
    InfoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<InfoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InfoDetailScreen(
          info: args.info,
          key: args.key,
        ),
      );
    },
    ScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreen(),
      );
    },
    ScheduleSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleSearchScreen(),
      );
    },
    ScheduleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleDetailScreen(
          categoryEntity: args.categoryEntity,
          key: args.key,
        ),
      );
    },
    ScheduleSearchResultRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleSearchResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleSearchResultScreen(
          args.performance,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InfoRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoScreens(),
      );
    },
    ScheduleRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreens(),
      );
    },
  };
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialScreen]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavouritesScreen]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoDetailScreen]
class InfoDetailRoute extends PageRouteInfo<InfoDetailRouteArgs> {
  InfoDetailRoute({
    required Info info,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          InfoDetailRoute.name,
          args: InfoDetailRouteArgs(
            info: info,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InfoDetailRoute';

  static const PageInfo<InfoDetailRouteArgs> page =
      PageInfo<InfoDetailRouteArgs>(name);
}

class InfoDetailRouteArgs {
  const InfoDetailRouteArgs({
    required this.info,
    this.key,
  });

  final Info info;

  final Key? key;

  @override
  String toString() {
    return 'InfoDetailRouteArgs{info: $info, key: $key}';
  }
}

/// generated route for
/// [ScheduleScreen]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleSearchScreen]
class ScheduleSearchRoute extends PageRouteInfo<void> {
  const ScheduleSearchRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleDetailScreen]
class ScheduleDetailRoute extends PageRouteInfo<ScheduleDetailRouteArgs> {
  ScheduleDetailRoute({
    required ScheduleCategoryEntity categoryEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleDetailRoute.name,
          args: ScheduleDetailRouteArgs(
            categoryEntity: categoryEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleDetailRoute';

  static const PageInfo<ScheduleDetailRouteArgs> page =
      PageInfo<ScheduleDetailRouteArgs>(name);
}

class ScheduleDetailRouteArgs {
  const ScheduleDetailRouteArgs({
    required this.categoryEntity,
    this.key,
  });

  final ScheduleCategoryEntity categoryEntity;

  final Key? key;

  @override
  String toString() {
    return 'ScheduleDetailRouteArgs{categoryEntity: $categoryEntity, key: $key}';
  }
}

/// generated route for
/// [ScheduleSearchResultScreen]
class ScheduleSearchResultRoute
    extends PageRouteInfo<ScheduleSearchResultRouteArgs> {
  ScheduleSearchResultRoute({
    required Performance performance,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleSearchResultRoute.name,
          args: ScheduleSearchResultRouteArgs(
            performance: performance,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleSearchResultRoute';

  static const PageInfo<ScheduleSearchResultRouteArgs> page =
      PageInfo<ScheduleSearchResultRouteArgs>(name);
}

class ScheduleSearchResultRouteArgs {
  const ScheduleSearchResultRouteArgs({
    required this.performance,
    this.key,
  });

  final Performance performance;

  final Key? key;

  @override
  String toString() {
    return 'ScheduleSearchResultRouteArgs{performance: $performance, key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoScreens]
class InfoRoutes extends PageRouteInfo<void> {
  const InfoRoutes({List<PageRouteInfo>? children})
      : super(
          InfoRoutes.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleScreens]
class ScheduleRoutes extends PageRouteInfo<void> {
  const ScheduleRoutes({List<PageRouteInfo>? children})
      : super(
          ScheduleRoutes.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}
