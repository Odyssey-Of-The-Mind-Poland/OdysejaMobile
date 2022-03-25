part of 'schedule_filter_bloc.dart';

abstract class ScheduleFilterState extends CityDataState {
  const ScheduleFilterState();
}

class ScheduleFilterSuccess extends ScheduleFilterState {
  const ScheduleFilterSuccess(this.performanceGroups);
  final List<PerformanceGroup> performanceGroups;

  List<String> get days =>
      performanceGroups.map((e) => e.day).toSet().toList()..sort((a, b) => b.compareTo(a));
}
