import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:odyssey_mobile/config/env_config.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';
import 'package:odyssey_mobile/app/state_observer.dart';
import 'package:odyssey_mobile/core/data/services/package_info_service.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:odyssey_mobile/features/update_data/data/update_data_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// TODO: Refactor and aggregate logging services. They should be injected into
// classes with failable methods and centralized around one logging class, instead
// of three seperate (dio interceptor, bloc observer, firebase logger in LoggerService)
// TODO: MAke clearer distinction between environments, with seperate dbs etc.
extension Initialize on GetIt {
  Future<void> init() async {
    sl.registerSingletonAsync(() => LoggerService.create(isWeb: kIsWeb));

    sl.registerSingleton<EnvConfig>(kDebugMode ? EnvConfig.development : EnvConfig.production);

    sl.registerSingleton(ApiService(_dioInstance, baseUrl: sl<EnvConfig>().baseUrl));

    sl.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

    sl.registerSingletonAsync<HiveDbService>(() => HiveDbService.create());

    sl.registerSingleton<PackageInfoService>(PackageInfoService());

    sl.registerSingleton<StoreService>(StoreService(config: sl()));

    sl.registerSingletonWithDependencies<UpdateDataRepository>(
      () => UpdateDataRepository(
        apiService: sl(),
        dbService: sl(),
        sharedPreferences: sl(),
        packageInfoService: sl(),
        storeService: sl(),
      ),
      dependsOn: [HiveDbService, SharedPreferences],
    );

    sl.registerSingletonWithDependencies<LoadDataRepository>(
      () => LoadDataRepository(dbService: sl()),
      dependsOn: [SharedPreferences, HiveDbService],
    );
    await sl.allReady(ignorePendingAsyncCreation: false);

    if (kDebugMode) {
      Bloc.observer = StateObserver(sl());
    }
  }

  Dio get _dioInstance {
    Dio dio = Dio(
      BaseOptions(
        sendTimeout: kIsWeb ? null : const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 7),
        headers: <String, String>{'accept': 'application/json'},
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: false,
          requestHeader: false,
          responseHeader: false,
        ),
      );
    }
    return dio;
  }
}

extension MaybeGet on GetIt {
  T? maybeGet<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  }) =>
      isRegistered<T>()
          ? get(instanceName: instanceName, param1: param1, param2: param2, type: type)
          : null;
}
