part of 'schedule_filter_bloc.dart';

abstract class ScheduleFilterEvent extends Equatable {
  const ScheduleFilterEvent();

  @override
  List<Object> get props => [];
}

class _ExternalRefresh extends ScheduleFilterEvent {
  const _ExternalRefresh(this.state);
  final CityDataState state;

  @override
  List<Object> get props => [state];
}
