import 'package:odyssey_mobile/core/data/api/models/city.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';
import 'package:odyssey_mobile/core/data/api/models/problem.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/timeTable')
  Future<List<PerformanceModelApi>> getSchedule({@Query('cityId') required int cityId});

  @GET('/stage')
  Future<List<StageModelApi>> getStages({@Query('cityId') required int cityId});

  @GET('/problem')
  Future<List<ProblemModelApi>> getProblems();

  @GET('/info')
  Future<List<InfoModelApi>> getInfo({@Query('cityId') required int cityId});

  @GET('/sponsor')
  Future<HttpResponse> getSponsor({@Query('cityId') required int cityId});

  @GET('/info/category')
  Future<List<InfoCategoryModelApi>> getInfoCategories();

  @GET('/city')
  Future<List<CityModelApi>> getCities();

  @GET('/version')
  Future<HttpResponse> getVersion();
}
