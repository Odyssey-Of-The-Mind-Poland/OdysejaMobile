// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:odyssey_mobile/app/app_config.dart' as _i4;
import 'package:odyssey_mobile/data/api/api_service.dart' as _i3;
import 'package:odyssey_mobile/data/data_repository.dart' as _i11;
import 'package:odyssey_mobile/data/db/db_service.dart' as _i5;
import 'package:odyssey_mobile/domain/data_repository.dart' as _i10;
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart'
    as _i8;
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart'
    as _i14;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/onboarding_bloc.dart'
    as _i12;
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/update_bloc.dart'
    as _i13;
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import 'injectable.dart' as _i15;

const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiService>(() => registerModule.apiService);
  gh.factory<_i4.AppConfig>(
    () => _i4.ProductionConfig(),
    registerFor: {_prod},
  );
  await gh.lazySingletonAsync<_i5.DbService>(
    () => registerModule.dbService,
    preResolve: true,
  );
  gh.lazySingleton<_i6.Dio>(() => registerModule.dioInstance);
  gh.factoryParam<_i7.ScheduleSearchBloc, _i8.CityDataBloc, dynamic>((
    _cityBloc,
    _,
  ) =>
      _i7.ScheduleSearchBloc(_cityBloc));
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i10.DataRepository>(
    () => _i11.DataRepositoryImpl(
      gh<_i3.ApiService>(),
      gh<_i9.SharedPreferences>(),
      gh<_i5.DbService>(),
    ),
    registerFor: {_prod},
  );
  gh.factory<_i12.OnboardingBloc>(
      () => _i12.OnboardingBloc(gh<_i10.DataRepository>()));
  gh.factory<_i13.UpdateBloc>(() => _i13.UpdateBloc(gh<_i10.DataRepository>()));
  gh.factory<_i14.UpdateFavouritesBloc>(
      () => _i14.UpdateFavouritesBloc(gh<_i10.DataRepository>()));
  gh.factory<_i8.CityDataBloc>(
      () => _i8.CityDataBloc(gh<_i10.DataRepository>()));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
