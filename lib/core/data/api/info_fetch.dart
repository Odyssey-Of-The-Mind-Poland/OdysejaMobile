import 'package:dio/dio.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';

typedef InfoPayload = ({List<InfoModelApi> infos, List<InfoCategoryModelApi> categories});

extension InfoFetch on ApiService {
  /// Loads infos with their categories from `/api/v3/info`, which resolves each tile's icon and
  /// colour on the server. Servers that do not have the endpoint yet answer 404/405; then the
  /// app falls back to the original endpoints and styles the tiles itself.
  Future<InfoPayload> getInfoPayload({required int cityId}) async {
    try {
      final response = await getInfoV3(cityId: cityId);
      return (infos: response.infos, categories: response.categories);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status != 404 && status != 405) rethrow;
    }

    final results = await Future.wait([getInfo(cityId: cityId), getInfoCategories()], eagerError: true);
    return (
      infos: results[0] as List<InfoModelApi>,
      categories: results[1] as List<InfoCategoryModelApi>,
    );
  }
}
