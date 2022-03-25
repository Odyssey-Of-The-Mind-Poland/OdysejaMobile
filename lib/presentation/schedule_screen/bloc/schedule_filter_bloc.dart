import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';

part 'schedule_filter_event.dart';
part 'schedule_filter_state.dart';

class ScheduleFilterBloc extends Bloc<ScheduleFilterEvent, CityDataState> {
  ScheduleFilterBloc(this._scheduleCategory, this._externalBloc) : super(const CityDataLoading()) {
    on<_ExternalRefresh>(_externalRefreshHandler);
    _blocSubscription = _externalBloc.stream.listen((state) => add(_ExternalRefresh(state)));
    add(_ExternalRefresh(_externalBloc.state));
  }
  final CityDataBloc _externalBloc;
  late final StreamSubscription _blocSubscription;
  final ScheduleCategoryEntity _scheduleCategory;

  void _externalRefreshHandler(_ExternalRefresh event, Emitter<CityDataState> emit) {
    if (event.state.runtimeType == CityDataSuccess) {
      final data = _filterGroups(event);
      emit(ScheduleFilterSuccess(data));
    } else {
      emit(event.state);
    }
  }

  @override
  Future<void> close() {
    _blocSubscription.cancel();
    return super.close();
  }

  List<PerformanceGroup> _filterGroups(_ExternalRefresh event) {
    final pfGroups = (event.state as CityDataSuccess).cityData.performanceGroups;
    switch (_scheduleCategory.category) {
      case ScheduleCategory.stage:
        return pfGroups.where((e) => e.stage == _scheduleCategory.number).toList();
      case ScheduleCategory.problem:
        return pfGroups.where((e) => e.problem == _scheduleCategory.number).toList();
      case ScheduleCategory.age:
        return pfGroups.where((e) => e.age == _scheduleCategory.number).toList();
    }
  }
}
