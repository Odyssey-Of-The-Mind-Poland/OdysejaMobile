// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [FavouritesScreen]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavouritesScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [InfoDetailScreen]
class InfoDetailRoute extends PageRouteInfo<InfoDetailRouteArgs> {
  InfoDetailRoute({required Info info, Key? key, List<PageRouteInfo>? children})
    : super(
        InfoDetailRoute.name,
        args: InfoDetailRouteArgs(info: info, key: key),
        initialChildren: children,
      );

  static const String name = 'InfoDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfoDetailRouteArgs>();
      return InfoDetailScreen(info: args.info, key: args.key);
    },
  );
}

class InfoDetailRouteArgs {
  const InfoDetailRouteArgs({required this.info, this.key});

  final Info info;

  final Key? key;

  @override
  String toString() {
    return 'InfoDetailRouteArgs{info: $info, key: $key}';
  }
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
    : super(InfoRoute.name, initialChildren: children);

  static const String name = 'InfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfoScreen();
    },
  );
}

/// generated route for
/// [InfoScreens]
class InfoRoutes extends PageRouteInfo<void> {
  const InfoRoutes({List<PageRouteInfo>? children})
    : super(InfoRoutes.name, initialChildren: children);

  static const String name = 'InfoRoutes';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfoScreens();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingScreen();
    },
  );
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScheduleDetailRouteArgs>();
      return ScheduleDetailScreen(
        categoryEntity: args.categoryEntity,
        key: args.key,
      );
    },
  );
}

class ScheduleDetailRouteArgs {
  const ScheduleDetailRouteArgs({required this.categoryEntity, this.key});

  final ScheduleCategoryEntity categoryEntity;

  final Key? key;

  @override
  String toString() {
    return 'ScheduleDetailRouteArgs{categoryEntity: $categoryEntity, key: $key}';
  }
}

/// generated route for
/// [ScheduleScreen]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
    : super(ScheduleRoute.name, initialChildren: children);

  static const String name = 'ScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleScreen();
    },
  );
}

/// generated route for
/// [ScheduleScreens]
class ScheduleRoutes extends PageRouteInfo<void> {
  const ScheduleRoutes({List<PageRouteInfo>? children})
    : super(ScheduleRoutes.name, initialChildren: children);

  static const String name = 'ScheduleRoutes';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleScreens();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScheduleSearchResultRouteArgs>();
      return ScheduleSearchResultScreen(args.performance, key: args.key);
    },
  );
}

class ScheduleSearchResultRouteArgs {
  const ScheduleSearchResultRouteArgs({required this.performance, this.key});

  final Performance performance;

  final Key? key;

  @override
  String toString() {
    return 'ScheduleSearchResultRouteArgs{performance: $performance, key: $key}';
  }
}

/// generated route for
/// [ScheduleSearchScreen]
class ScheduleSearchRoute extends PageRouteInfo<void> {
  const ScheduleSearchRoute({List<PageRouteInfo>? children})
    : super(ScheduleSearchRoute.name, initialChildren: children);

  static const String name = 'ScheduleSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleSearchScreen();
    },
  );
}
