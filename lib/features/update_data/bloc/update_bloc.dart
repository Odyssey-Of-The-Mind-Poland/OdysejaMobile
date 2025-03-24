import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/features/update_data/data/update_data_repository.dart';
import 'package:odyssey_mobile/core/extensions.dart';
import 'package:odyssey_mobile/features/update_data/domain/app_update_status.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc(this._repository) : super(const UpdateLoading()) {
    on<CheckForUpdatesEvent>((event, emit) async {
      if (!_repository.shouldCheckForUpdates() && !event.forceUpdate) {
        emit(const UpdateFinished());
        return;
      }

      final appUpdate = _repository.checkAppAPICompatibility();
      final dataUpdate = _repository.isDataUpdateAvailable();

      final results = await [appUpdate, dataUpdate].wait(eagerError: true);

      await results.fold(
        (failure) async => emit(UpdateFailed(
          failure,
          offlineModeAvailable: _repository.isOfflineModeAvailable,
        )),
        (r) async {
          final AppUpdateStatus appUpdate = r[0].asRight();
          final ({bool updateAvailable, int version}) dataUpdate = r[1].asRight();

          if (appUpdate == AppUpdateStatus.required) {
            emit(const AppUpdateRequired());
            return;
          }

          if (!dataUpdate.updateAvailable && !event.forceUpdate) {
            emit(UpdateFinished(appUpdateRecommended: appUpdate == AppUpdateStatus.recommended));
            return;
          }

          final result = await _repository.updateData(newVersion: dataUpdate.version);
          result.fold(
            () => emit(
                UpdateFinished(appUpdateRecommended: appUpdate == AppUpdateStatus.recommended)),
            (failure) => emit(UpdateFailed(
              failure,
              offlineModeAvailable: _repository.isOfflineModeAvailable,
            )),
          );
        },
      );
    });
  }
  final UpdateDataRepository _repository;
}
