import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city_data.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/domain/city_data.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';

class _FakeRepository implements LoadDataRepository {
  _FakeRepository(this.data, this.problems);

  final CityData data;
  final List<ScheduleCategoryEntity> problems;

  @override
  Future<Either<Failure, CityData>> getCityData(int cityId) async => right(data);

  @override
  Future<Either<Failure, List<ScheduleCategoryEntity>>> getProblems() async => right(problems);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError('${invocation.memberName}');
}

CityDataHiveModel cityDataWith({List<InfoGroupHiveModel> infoGroups = const []}) => CityDataHiveModel(
      cityId: 1,
      cityName: 'Warszawa',
      infoGroups: infoGroups,
      performanceGroups: const [],
      stages: const [],
      sponsorModel: const [],
    );

InfoHiveModel infoItem(int category, String name, {String text = 'Treść', String? icon, String? color}) =>
    InfoHiveModel(category, name, text, 0, icon, color);

/// A [CityDataBloc] that already holds [data] (loaded through a fake repository).
Future<CityDataBloc> loadedCityDataBloc(
  CityData data, {
  List<ScheduleCategoryEntity> problems = const [],
}) async {
  final bloc = CityDataBloc(_FakeRepository(data, problems))..add(const FetchCityData(1));
  await bloc.stream.firstWhere((state) => state is CityDataSuccess);
  return bloc;
}

/// Pumps [child] under the app theme with a loaded city.
Widget withCity(
  CityDataBloc bloc,
  Widget child, {
  Brightness brightness = Brightness.light,
}) =>
    BlocProvider<CityDataBloc>.value(
      value: bloc,
      child: MaterialApp(
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        home: child,
      ),
    );
