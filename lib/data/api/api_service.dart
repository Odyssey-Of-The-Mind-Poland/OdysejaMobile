import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/timeTable')
  Future<List<PerformanceModelApi>> getSchedule();

  @GET('/stage')
  Future<List<StageModelApi>> getStages();

  @GET('/problem')
  Future<List<ProblemModelApi>> getProblems();

  @GET('/info')
  Future<List<InfoModelApi>> getInfo();

  @GET('/sponsor')
  Future<List<List<SponsorModelApi>>> getSponsor();

  @GET('/info/category')
  Future<List<InfoCategoryModelApi>> getInfoCategories();

  /// Not used.
  // @GET('/age')
  // Future<List<AgeGroup>> getAgeGroups();

  /// Not used this year.
  // @GET('/sponsor')
  // Future<List<Sponsor>> getSponsors();

  // @GET('/sponsor/{imageId}')
  // Future<List<String>> getSponsorImage(@Path('imageId') int imageId);

  @GET('/city')
  Future<List<CityModelApi>> getCities();

  @GET('/version')
  Future<HttpResponse> getVersion();
}
