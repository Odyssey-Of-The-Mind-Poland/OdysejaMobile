import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/api/models/age.dart';
import 'package:odyssey_mobile/core/data/api/models/city.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/info_v2.dart';
import 'package:odyssey_mobile/core/data/api/models/performance_group_v2.dart';
import 'package:odyssey_mobile/core/data/api/models/problem.dart';
import 'package:odyssey_mobile/core/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/features/update_data/data/update_data_repository.dart';
import 'package:odyssey_mobile/core/data/services/division_style_store.dart';
import 'package:odyssey_mobile/core/data/services/package_info_service.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeApi implements ApiService {
  _FakeApi({this.ages = const [], this.agesStatus});

  final loadedCityIds = <int>[];
  final List<AgeModelApi> ages;

  /// When set, the age styles endpoint fails with this status (a backend that does not know it yet).
  final int? agesStatus;

  @override
  Future<List<AgeModelApi>> getAges() async {
    final status = agesStatus;
    if (status == null) return ages;
    final options = RequestOptions(path: '/age');
    throw DioException(requestOptions: options, response: Response(requestOptions: options, statusCode: status));
  }

  @override
  Future<List<ProblemModelApi>> getProblems() async => [];

  @override
  Future<List<CityModelApi>> getCities() async => [
        CityModelApi(id: 0, name: 'finał'),
        CityModelApi(id: 52, name: 'Poznań'),
        CityModelApi(id: 2, name: 'Sosnowiec'),
      ];

  @override
  Future<InfoV2Response> getInfoV3({required int cityId}) async {
    loadedCityIds.add(cityId);
    return InfoV2Response(infos: <InfoModelApi>[], categories: <InfoCategoryModelApi>[]);
  }

  @override
  Future<List<PerformanceGroupV2ModelApi>> getScheduleV2({required int cityId}) async => [];

  @override
  Future<List<StageModelApi>> getStages({required int cityId}) async => [];

  @override
  Future<HttpResponse> getSponsor({required int cityId}) async =>
      HttpResponse([], Response(requestOptions: RequestOptions(path: '/sponsor')));

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

class _FakeDb implements HiveDbService {
  List<CityModelApi> storedCities = [];
  final storedCityData = <int>[];

  @override
  Future<List<int>> readFavIds() async => [];

  @override
  Future<void> clearData() async {}

  @override
  Future<void> createProblems(List<ProblemModelApi> problems) async {}

  @override
  createCities(List<CityModelApi> cities) => storedCities = cities;

  @override
  Future<void> createCityData({
    required CityModelApi cityModels,
    required List<InfoModelApi> infoModels,
    required List<InfoCategoryModelApi> infoCategories,
    required List<PerformanceGroupV2ModelApi> performanceGroupsApi,
    required List<StageModelApi> stageModels,
    required List<int> previousFavIds,
    required List<List<SponsorModelApi>> sponsors,
  }) async =>
      storedCityData.add(cityModels.id);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

class _FakePackageInfo implements PackageInfoService {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

class _FakeStore implements StoreService {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

void main() {
  test('updateData stores and loads every city, not only the first one', () async {
    SharedPreferences.setMockInitialValues({});
    final api = _FakeApi();
    final db = _FakeDb();
    final repository = UpdateDataRepository(
      apiService: api,
      dbService: db,
      sharedPreferences: await SharedPreferences.getInstance(),
      packageInfoService: _FakePackageInfo(),
      storeService: _FakeStore(),
    );

    final failure = await repository.updateData(newVersion: 1);

    expect(failure.isNone(), isTrue);
    expect(db.storedCities.map((c) => c.id), [0, 52, 2]);
    expect(db.storedCityData, [0, 52, 2]);
    expect(api.loadedCityIds, [0, 52, 2]);
  });

  group('age group styles', () {
    Future<UpdateDataRepository> repositoryFor(_FakeApi api) async => UpdateDataRepository(
          apiService: api,
          dbService: _FakeDb(),
          sharedPreferences: await SharedPreferences.getInstance(),
          packageInfoService: _FakePackageInfo(),
          storeService: _FakeStore(),
        );

    test('updateData keeps the style of the age groups', () async {
      SharedPreferences.setMockInitialValues({});
      final repository = await repositoryFor(_FakeApi(ages: [AgeModelApi(id: 2, icon: 'star-01', color: 'red')]));

      final failure = await repository.updateData(newVersion: 1);

      final divisions = DivisionStyleStore(await SharedPreferences.getInstance()).divisions;
      expect(failure.isNone(), isTrue);
      expect(divisions[2].icon, 'star-01');
      expect(divisions[2].color, 'red');
      expect(divisions[1].color, isNull);
    });

    test('a backend without age styles still updates the data and clears old styles', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      await DivisionStyleStore(prefs).save([AgeModelApi(id: 0, icon: 'star-01', color: 'red')]);
      final repository = await repositoryFor(_FakeApi(agesStatus: 404));

      final failure = await repository.updateData(newVersion: 1);

      expect(failure.isNone(), isTrue);
      expect(DivisionStyleStore(prefs).divisions[0].color, isNull);
    });

    test('a failing age request fails the update', () async {
      SharedPreferences.setMockInitialValues({});
      final repository = await repositoryFor(_FakeApi(agesStatus: 500));

      final failure = await repository.updateData(newVersion: 1);

      expect(failure.isSome(), isTrue);
    });
  });
}
