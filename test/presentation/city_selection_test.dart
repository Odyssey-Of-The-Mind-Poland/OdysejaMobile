import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/domain/city_data.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/selected_city_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/city_data_host.dart';

class _Repo implements LoadDataRepository {
  _Repo(this.available);

  final Set<int> available;
  final requested = <int>[];

  @override
  Future<Either<Failure, CityData>> getCityData(int cityId) async {
    requested.add(cityId);
    return available.contains(cityId) ? right(FakeCityData(cityId: cityId)) : left(const DataBaseFailure());
  }

  @override
  List<DivisionEntity> getDivisions() => defaultDivisions;

  @override
  Future<Either<Failure, List<ScheduleCategoryEntity>>> getProblems() async => right(<ScheduleCategoryEntity>[]);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

void main() {
  group('SelectedCityStore', () {
    test('defaults to the finals and remembers the chosen city', () async {
      SharedPreferences.setMockInitialValues({});
      final store = SelectedCityStore(await SharedPreferences.getInstance());

      expect(store.cityId, SelectedCityStore.defaultCityId);

      await store.save(52);

      expect(SelectedCityStore(await SharedPreferences.getInstance()).cityId, 52);
    });
  });

  group('CityDataBloc', () {
    test('loads the requested city', () async {
      final bloc = CityDataBloc(_Repo({0, 52}))..add(const FetchCityData(52));

      final state = await bloc.stream.firstWhere((s) => s is CityDataSuccess) as CityDataSuccess;

      expect(state.cityData.cityId, 52);
    });

    test('falls back to the finals when the remembered city is gone', () async {
      final repo = _Repo({0});
      final bloc = CityDataBloc(repo)..add(const FetchCityData(52));

      final state = await bloc.stream.firstWhere((s) => s is CityDataSuccess) as CityDataSuccess;

      expect(state.cityData.cityId, 0);
      expect(repo.requested, [52, 0]);
    });

    test('reports an error when even the finals are missing', () async {
      final bloc = CityDataBloc(_Repo({}))..add(const FetchCityData(52));

      expect(await bloc.stream.firstWhere((s) => s is! CityDataLoading), isA<CityDataError>());
    });
  });
}
