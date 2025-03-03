import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:odyssey_mobile/consts/app_config.dart';
import 'package:odyssey_mobile/data/api/api_service.dart';
import 'package:odyssey_mobile/data/data_repository.dart';
import 'package:odyssey_mobile/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/data/services/logger_service.dart';
import 'package:odyssey_mobile/presentation/state_observer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

enum Env { dev, prod }

// TODO: Refactor and aggregate logging services. They should be injected into
// classes with failable methods and centralized around one logging class, instead
// of three seperate (dio interceptor, bloc observer, firebase logger in LoggerService)
// TODO: MAke clearer distinction between environments, with seperate dbs etc.
extension Initialize on GetIt {
  Future<void> init() async {
    const env = kDebugMode ? Env.dev : Env.prod;
    if (!kIsWeb) {
      sl.registerSingletonAsync(() => LoggerService.create());
    }

    sl.registerSingleton<AppConfig>(env == Env.dev ? DevConfig() : ProductionConfig());

    sl.registerLazySingleton(() => ApiService(_dioInstance, baseUrl: sl<AppConfig>().baseUrl));

    sl.registerSingletonAsync(() => SharedPreferences.getInstance());

    sl.registerSingletonAsync<HiveDbService>(() => HiveDbService.create());

    sl.registerSingletonWithDependencies<DataRepository>(
      () => DataRepository(apiService: sl(), dbService: sl(), sharedPrefs: sl()),
      dependsOn: [SharedPreferences, HiveDbService],
    );
    await sl.allReady(ignorePendingAsyncCreation: false);

    if (kDebugMode && !kIsWeb) {
      Bloc.observer = StateObserver(sl());
    }
  }

  Dio get _dioInstance {
    Dio dio = Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 5),
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
