import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/features/update_data/data/update_data_repository.dart';
import 'package:odyssey_mobile/features/update_data/domain/app_update_status.dart';
import 'package:rxdart/rxdart.dart';

part 'update_event.dart';
part 'update_state.dart';

//TODO: See if the code can refactored into a function chain, making it simpler and easier to follow.
class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc(this._repository) : super(const UpdateInitial()) {
    on<CheckForUpdatesEvent>((event, emit) async {
      if (!event.isBoot && !_repository.shouldCheckForUpdates(_throttleTime)) {
        return;
      }
      emit(const UpdateLoading());

      final appUpdateFuture = _repository.checkAppAPICompatibility();
      final dataUpdateAvailableFuture = _repository.isDataUpdateAvailable();

      final results = await Future.wait([appUpdateFuture, dataUpdateAvailableFuture]);

      final appUpdate = results[0] as Either<Failure, AppUpdateStatus>;

      await appUpdate.fold(
        (l) async => _updateFailed(l, emit),
        (status) async {
          if (status == AppUpdateStatus.required || status == AppUpdateStatus.impossible) {
            _repository.markDataAsDirty();
            emit(AppUpdateRequired(
              status: status,
              offlineAvailable: _repository.isOfflineModeAvailable,
            ));
            return;
          }

          final dataUpdateAvailable =
              results[1] as Either<Failure, ({bool updateAvailable, int version})>;

          await dataUpdateAvailable.fold(
            (l) async => _updateFailed(l, emit),
            (r) async {
              if (!r.updateAvailable && !_repository.isDataDirty) {
                await _repository.saveCheckDate();
                emit(UpdateFinished(status));
                return;
              }

              final result = await _repository.updateData(newVersion: r.version);
              await result.fold(
                () async {
                  await _repository.saveCheckDate();
                  await _repository.saveDataVersion(r.version);
                  await _repository.clearDataDirtyFlagIfAny();
                  emit(UpdateFinished(status));
                },
                (failure) async => _updateFailed(failure, emit),
              );
            },
          );
        },
      );
    }, transformer: throttleTransformer());
    on<SkipAppUpdateEvent>((event, emit) {
      _repository.markAppUpdateAsSkipped();
    });
  }
  void _updateFailed(Failure f, Emitter<UpdateState> emit) =>
      emit(UpdateFailed(f, offlineModeAvailable: _repository.isOfflineModeAvailable));

  final UpdateDataRepository _repository;

  static const _throttleTime = Duration(hours: 8);

  /// Additional throttle mechanism to prevent multiple API requests mid check process.
  /// It's not sufficient on its own due to posibility of pausing the app in the background,
  /// breaking the throttle mechanism. Therefore, a solution with persistence is also necessary
  /// (like [_repository.shouldCheckForUpdates] method).
  EventTransformer<CheckForUpdatesEvent> throttleTransformer<Event>() =>
      (events, mapper) => events.throttleTime(_throttleTime).asyncExpand(mapper);
}
