import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/core/typedefs.dart';
import 'package:odyssey_mobile/features/update_data/data/update_data_repository.dart';
import 'package:odyssey_mobile/features/update_data/domain/app_update_status.dart';

class UpdateDataRepositoryWeb extends UpdateDataRepository {
  UpdateDataRepositoryWeb({
    required super.apiService,
    required super.dbService,
    required super.sharedPreferences,
    required super.packageInfoService,
    required super.storeService,
  });

  @override
  AsyncResult<AppUpdateStatus> checkAppAPICompatibility() async => right(AppUpdateStatus.web);
}
