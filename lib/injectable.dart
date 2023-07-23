import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:odyssey_mobile/consts/app_config.dart';
import 'package:odyssey_mobile/data/api/api_service.dart';
import 'package:odyssey_mobile/data/data_repository.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
import 'package:odyssey_mobile/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/data/db/isar/isar_service.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

enum Env { dev, prod }

extension Initialize on GetIt {
  Future<void> init(Env env) async {
    sl.registerSingleton<AppConfig>(env == Env.dev ? DevConfig() : ProductionConfig());

    sl.registerLazySingleton(() => ApiService(_dioInstance, baseUrl: sl<AppConfig>().baseUrl));

    sl.registerSingletonAsync(() => SharedPreferences.getInstance());

    // TODO: Test Isar for web
    sl.registerSingletonAsync<DbService>(
        () => kIsWeb ? HiveDbService.create() : IsarDbService.create());

    sl.registerSingletonWithDependencies<DataRepository>(
        () => DataRepositoryImpl(
              apiService: sl(),
              dbService: sl(),
              sharedPrefs: sl(),
            ),
        dependsOn: [SharedPreferences, DbService]);
    await sl.allReady(ignorePendingAsyncCreation: false);
  }

  Dio get _dioInstance {
    Dio dio = Dio(BaseOptions(
      sendTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 7),
      headers: <String, String>{
        'accept': 'application/json',
      },
    ));
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: false,
        requestBody: false,
        requestHeader: false,
        responseHeader: false,
      ));
    }
    return dio;
  }
}
