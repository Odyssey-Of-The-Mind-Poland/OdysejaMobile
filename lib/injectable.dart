import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/app/app_config.dart';
import 'package:odyssey_mobile/data/api/api_service.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
// import 'package:odyssey_mobile/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/data/db/isar/isar_service.dart';
import 'package:odyssey_mobile/injectable.config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true, asExtension: false)
Future<void> configureDependencies(String env) => init(getIt, environment: env);

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dioInstance {
    Dio _dio = Dio(BaseOptions(
      sendTimeout: 5000,
      connectTimeout: 5000,
      receiveTimeout: 7000,
      headers: <String, String>{
        'accept': 'application/json',
      },
    ));
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        responseBody: false,
        requestBody: false,
        requestHeader: false,
        responseHeader: false,
      ));
    }
    return _dio;
  }

  @lazySingleton
  ApiService get apiService => ApiService(getIt<Dio>(), baseUrl: getIt<AppConfig>().baseUrl);

  @preResolve
  @lazySingleton
  Future<DbService> get dbService async {
    final dbService = IsarDbService();
    await dbService.init();
    return dbService;
  }

  // @preResolve
  // @LazySingleton(env: [])
  // Future<DbService> get dbService async {
  //   final dbService = HiveDbService();
  //   await dbService.init();
  //   return dbService;
  // }
}
