import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/api/info_fetch.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/info_v2.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_data_adapter.dart';

InfoModelApi _info(int id, {String? icon, String? color}) => InfoModelApi(
      id: id,
      infoName: 'Info $id',
      infoText: 'Tekst',
      city: 1,
      category: 7,
      sortNumber: id,
      icon: icon,
      color: color,
    );

DioException _httpError(int status) => DioException(
      requestOptions: RequestOptions(path: '/api/v3/info'),
      response: Response(requestOptions: RequestOptions(path: '/api/v3/info'), statusCode: status),
      type: DioExceptionType.badResponse,
    );

class _FakeApi implements ApiService {
  _FakeApi({this.v3Error});

  final DioException? v3Error;
  final calls = <String>[];

  @override
  Future<InfoV2Response> getInfoV3({required int cityId}) async {
    calls.add('v3');
    if (v3Error != null) throw v3Error!;
    return InfoV2Response(
      infos: [_info(1, icon: 'map-01', color: 'purple')],
      categories: [InfoCategoryModelApi(id: 7, name: 'Dla drużyn')],
    );
  }

  @override
  Future<List<InfoModelApi>> getInfo({required int cityId}) async {
    calls.add('v1 info');
    return [_info(2)];
  }

  @override
  Future<List<InfoCategoryModelApi>> getInfoCategories() async {
    calls.add('v1 categories');
    return [InfoCategoryModelApi(id: 7, name: 'Dla drużyn')];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

void main() {
  group('getInfoPayload', () {
    test('uses the v3 endpoint when the server has it', () async {
      final api = _FakeApi();

      final payload = await api.getInfoPayload(cityId: 1);

      expect(api.calls, ['v3']);
      expect(payload.infos.single.icon, 'map-01');
      expect(payload.infos.single.color, 'purple');
      expect(payload.categories.single.name, 'Dla drużyn');
    });

    test('falls back to the original endpoints on 404', () async {
      final api = _FakeApi(v3Error: _httpError(404));

      final payload = await api.getInfoPayload(cityId: 1);

      expect(api.calls, ['v3', 'v1 info', 'v1 categories']);
      expect(payload.infos.single.id, 2);
      expect(payload.infos.single.icon, isNull);
    });

    test('falls back on 405 as well', () async {
      final api = _FakeApi(v3Error: _httpError(405));

      await api.getInfoPayload(cityId: 1);

      expect(api.calls, contains('v1 info'));
    });

    test('does not hide real server failures', () async {
      final api = _FakeApi(v3Error: _httpError(500));

      await expectLater(api.getInfoPayload(cityId: 1), throwsA(isA<DioException>()));
      expect(api.calls, ['v3']);
    });

    test('does not hide connectivity failures', () async {
      final api = _FakeApi(
        v3Error: DioException(
          requestOptions: RequestOptions(path: '/api/v3/info'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      await expectLater(api.getInfoPayload(cityId: 1), throwsA(isA<DioException>()));
    });
  });

  group('InfoModelApi', () {
    test('parses icon and color when the server sends them', () {
      final info = InfoModelApi.fromJson({
        'id': 1,
        'infoName': 'A',
        'infoText': 'B',
        'city': 1,
        'category': 2,
        'sortNumber': 3,
        'icon': 'home-02',
        'color': 'green',
      });

      expect(info.icon, 'home-02');
      expect(info.color, 'green');
    });

    test('accepts responses of servers that do not know about styling', () {
      final info = InfoModelApi.fromJson({
        'id': 1,
        'infoName': 'A',
        'infoText': 'B',
        'city': 1,
        'category': 2,
        'sortNumber': 3,
      });

      expect(info.icon, isNull);
      expect(info.color, isNull);
    });
  });

  test('icon and color survive the conversion to the stored model', () {
    final converted = HiveDataAdapter.convertInfoGroupsForTest(
      [InfoCategoryModelApi(id: 7, name: 'Dla drużyn')],
      [_info(1, icon: 'trophy-01', color: 'red'), _info(2)],
    );

    final infos = converted.single.info;
    expect(infos[0].icon, 'trophy-01');
    expect(infos[0].color, 'red');
    expect(infos[1].icon, isNull);
  });
}
