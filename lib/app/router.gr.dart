// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:odyssey_mobile/domain/entities/info.dart' as _i17;
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart'
    as _i18;
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_screen.dart'
    as _i9;
import 'package:odyssey_mobile/presentation/home_screen/home_screen.dart'
    as _i6;
import 'package:odyssey_mobile/presentation/info_screen/info_detail_screen.dart'
    as _i11;
import 'package:odyssey_mobile/presentation/info_screen/info_router.dart'
    as _i7;
import 'package:odyssey_mobile/presentation/info_screen/info_screen.dart'
    as _i10;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/initial_screens.dart'
    as _i1;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/loading_screen.dart'
    as _i5;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/splash_screen.dart'
    as _i3;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/welcome_screen.dart'
    as _i4;
import 'package:odyssey_mobile/presentation/main_view/main_view.dart' as _i2;
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_detail_screen.dart'
    as _i13;
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_router.dart'
    as _i8;
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_screen.dart'
    as _i12;
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_search_screen.dart'
    as _i14;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    InitialScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.InitialScreen(),
          maintainState: false);
    },
    MainView.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MainView());
    },
    SplashScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SplashScreen());
    },
    WelcomeScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.WelcomeScreen());
    },
    LoadingScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.LoadingScreen());
    },
    HomeScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    InfoRouter.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.InfoRouter());
    },
    ScheduleRouter.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ScheduleRouter());
    },
    FavouritesScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.FavouritesScreen());
    },
    InfoScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.InfoScreen());
    },
    InfoDetailScreen.name: (routeData) {
      final args = routeData.argsAs<InfoDetailScreenArgs>();
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.InfoDetailScreen(info: args.info, key: args.key));
    },
    ScheduleScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.ScheduleScreen());
    },
    ScheduleDetailScreen.name: (routeData) {
      final args = routeData.argsAs<ScheduleDetailScreenArgs>();
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i13.ScheduleDetailScreen(
              categoryEntity: args.categoryEntity, key: args.key));
    },
    ScheduleSearchScreen.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.ScheduleSearchScreen());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(InitialScreen.name, path: '/', children: [
          _i15.RouteConfig(SplashScreen.name,
              path: '', parent: InitialScreen.name),
          _i15.RouteConfig(WelcomeScreen.name,
              path: 'welcome-screen', parent: InitialScreen.name),
          _i15.RouteConfig(LoadingScreen.name,
              path: 'loading-screen', parent: InitialScreen.name)
        ]),
        _i15.RouteConfig(MainView.name, path: '/main-view', children: [
          _i15.RouteConfig(HomeScreen.name, path: '', parent: MainView.name),
          _i15.RouteConfig(InfoRouter.name,
              path: 'info-router',
              parent: MainView.name,
              children: [
                _i15.RouteConfig(InfoScreen.name,
                    path: '', parent: InfoRouter.name),
                _i15.RouteConfig(InfoDetailScreen.name,
                    path: 'info-detail-screen', parent: InfoRouter.name)
              ]),
          _i15.RouteConfig(ScheduleRouter.name,
              path: 'schedule-router',
              parent: MainView.name,
              children: [
                _i15.RouteConfig(ScheduleScreen.name,
                    path: '', parent: ScheduleRouter.name),
                _i15.RouteConfig(ScheduleDetailScreen.name,
                    path: 'schedule-detail-screen',
                    parent: ScheduleRouter.name),
                _i15.RouteConfig(ScheduleSearchScreen.name,
                    path: 'schedule-search-screen', parent: ScheduleRouter.name)
              ]),
          _i15.RouteConfig(FavouritesScreen.name,
              path: 'favourites-screen', parent: MainView.name)
        ])
      ];
}

/// generated route for
/// [_i1.InitialScreen]
class InitialScreen extends _i15.PageRouteInfo<void> {
  const InitialScreen({List<_i15.PageRouteInfo>? children})
      : super(InitialScreen.name, path: '/', initialChildren: children);

  static const String name = 'InitialScreen';
}

/// generated route for
/// [_i2.MainView]
class MainView extends _i15.PageRouteInfo<void> {
  const MainView({List<_i15.PageRouteInfo>? children})
      : super(MainView.name, path: '/main-view', initialChildren: children);

  static const String name = 'MainView';
}

/// generated route for
/// [_i3.SplashScreen]
class SplashScreen extends _i15.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i4.WelcomeScreen]
class WelcomeScreen extends _i15.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: 'welcome-screen');

  static const String name = 'WelcomeScreen';
}

/// generated route for
/// [_i5.LoadingScreen]
class LoadingScreen extends _i15.PageRouteInfo<void> {
  const LoadingScreen() : super(LoadingScreen.name, path: 'loading-screen');

  static const String name = 'LoadingScreen';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i15.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i7.InfoRouter]
class InfoRouter extends _i15.PageRouteInfo<void> {
  const InfoRouter({List<_i15.PageRouteInfo>? children})
      : super(InfoRouter.name, path: 'info-router', initialChildren: children);

  static const String name = 'InfoRouter';
}

/// generated route for
/// [_i8.ScheduleRouter]
class ScheduleRouter extends _i15.PageRouteInfo<void> {
  const ScheduleRouter({List<_i15.PageRouteInfo>? children})
      : super(ScheduleRouter.name,
            path: 'schedule-router', initialChildren: children);

  static const String name = 'ScheduleRouter';
}

/// generated route for
/// [_i9.FavouritesScreen]
class FavouritesScreen extends _i15.PageRouteInfo<void> {
  const FavouritesScreen()
      : super(FavouritesScreen.name, path: 'favourites-screen');

  static const String name = 'FavouritesScreen';
}

/// generated route for
/// [_i10.InfoScreen]
class InfoScreen extends _i15.PageRouteInfo<void> {
  const InfoScreen() : super(InfoScreen.name, path: '');

  static const String name = 'InfoScreen';
}

/// generated route for
/// [_i11.InfoDetailScreen]
class InfoDetailScreen extends _i15.PageRouteInfo<InfoDetailScreenArgs> {
  InfoDetailScreen({required _i17.Info info, _i16.Key? key})
      : super(InfoDetailScreen.name,
            path: 'info-detail-screen',
            args: InfoDetailScreenArgs(info: info, key: key));

  static const String name = 'InfoDetailScreen';
}

class InfoDetailScreenArgs {
  const InfoDetailScreenArgs({required this.info, this.key});

  final _i17.Info info;

  final _i16.Key? key;

  @override
  String toString() {
    return 'InfoDetailScreenArgs{info: $info, key: $key}';
  }
}

/// generated route for
/// [_i12.ScheduleScreen]
class ScheduleScreen extends _i15.PageRouteInfo<void> {
  const ScheduleScreen() : super(ScheduleScreen.name, path: '');

  static const String name = 'ScheduleScreen';
}

/// generated route for
/// [_i13.ScheduleDetailScreen]
class ScheduleDetailScreen
    extends _i15.PageRouteInfo<ScheduleDetailScreenArgs> {
  ScheduleDetailScreen(
      {required _i18.ScheduleCategoryEntity categoryEntity, _i16.Key? key})
      : super(ScheduleDetailScreen.name,
            path: 'schedule-detail-screen',
            args: ScheduleDetailScreenArgs(
                categoryEntity: categoryEntity, key: key));

  static const String name = 'ScheduleDetailScreen';
}

class ScheduleDetailScreenArgs {
  const ScheduleDetailScreenArgs({required this.categoryEntity, this.key});

  final _i18.ScheduleCategoryEntity categoryEntity;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ScheduleDetailScreenArgs{categoryEntity: $categoryEntity, key: $key}';
  }
}

/// generated route for
/// [_i14.ScheduleSearchScreen]
class ScheduleSearchScreen extends _i15.PageRouteInfo<void> {
  const ScheduleSearchScreen()
      : super(ScheduleSearchScreen.name, path: 'schedule-search-screen');

  static const String name = 'ScheduleSearchScreen';
}
