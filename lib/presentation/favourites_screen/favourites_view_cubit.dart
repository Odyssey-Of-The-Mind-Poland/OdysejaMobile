import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';

enum FavouritesDisplayMode { list, timeline }

/// How the favourites are presented: as groups ("list") or as one chronological line
/// ("timeline"), optionally narrowed to chosen stages, problems and age groups.
/// An empty selection of a kind means "all".
class FavouritesView extends Equatable {
  const FavouritesView({
    this.mode = FavouritesDisplayMode.list,
    this.stages = const {},
    this.problems = const {},
    this.ages = const {},
  });

  final FavouritesDisplayMode mode;
  final Set<int> stages;
  final Set<int> problems;
  final Set<int> ages;

  bool get hasFilters => stages.isNotEmpty || problems.isNotEmpty || ages.isNotEmpty;

  bool matches(PerformanceGroup group) =>
      (stages.isEmpty || stages.contains(group.stage)) &&
      (problems.isEmpty || problems.contains(group.problem)) &&
      (ages.isEmpty || ages.contains(group.age));

  List<PerformanceGroup> apply(Iterable<PerformanceGroup> groups) =>
      groups.where(matches).toList();

  /// Performances of the matching groups in chronological order.
  List<Performance> timeline(Iterable<PerformanceGroup> groups) =>
      apply(groups).expand((group) => group.performances).toList()
        ..sort((a, b) => a.performanceDate.compareTo(b.performanceDate));

  FavouritesView copyWith({
    FavouritesDisplayMode? mode,
    Set<int>? stages,
    Set<int>? problems,
    Set<int>? ages,
  }) =>
      FavouritesView(
        mode: mode ?? this.mode,
        stages: stages ?? this.stages,
        problems: problems ?? this.problems,
        ages: ages ?? this.ages,
      );

  @override
  List<Object?> get props => [mode, stages, problems, ages];
}

class FavouritesViewCubit extends Cubit<FavouritesView> {
  FavouritesViewCubit() : super(const FavouritesView());

  void setMode(FavouritesDisplayMode mode) => emit(state.copyWith(mode: mode));

  void toggleStage(int stage) => emit(state.copyWith(stages: _toggle(state.stages, stage)));

  void toggleProblem(int problem) =>
      emit(state.copyWith(problems: _toggle(state.problems, problem)));

  void toggleAge(int age) => emit(state.copyWith(ages: _toggle(state.ages, age)));

  /// Clears the filters but keeps the display mode.
  void clearFilters() => emit(FavouritesView(mode: state.mode));

  Set<int> _toggle(Set<int> values, int value) =>
      values.contains(value) ? ({...values}..remove(value)) : {...values, value};
}
