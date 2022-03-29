import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:rxdart/transformers.dart';

part 'schedule_search_event.dart';
part 'schedule_search_state.dart';

@injectable
class ScheduleSearchBloc extends Bloc<SearchEvent, ScheduleSearchState> {
  ScheduleSearchBloc(@factoryParam this._cityBloc) : super(const SearchInitial()) {
    on<_ExternalRefresh>(_externalRefreshHandler);
    on<SearchRequest>(
      _searchRequestHandler,
      transformer: debounceSequential(const Duration(milliseconds: 100)),
    );

    _cityBlocSubscription = _cityBloc.stream.listen((state) => add(_ExternalRefresh(state)));
    add(_ExternalRefresh(_cityBloc.state));
  }
  List<Performance> _performances = [];
  final CityDataBloc _cityBloc;
  late final StreamSubscription _cityBlocSubscription;

  void _externalRefreshHandler(_ExternalRefresh event, Emitter<ScheduleSearchState> emit) {
    if (event.state.runtimeType == CityDataSuccess) {
      _performances = (event.state as CityDataSuccess)
          .cityData
          .performanceGroups
          .expand((pfg) => pfg.performances)
          .toList();
    }
  }

  // TODO could be optimised, however small scale excuses us a bit
  void _searchRequestHandler(SearchRequest event, Emitter<ScheduleSearchState> emit) {
    if (event.searchPhrase.isEmpty) {
      emit(const SearchInitial());
    } else {
      final lowerCase = event.searchPhrase.toLowerCase();
      final result = _performances.where((p) => p.searchableTeam.contains(lowerCase));
      emit(result.isEmpty
          ? const SearchEmpty()
          : SearchResult(
              performances: result.toList(),
              searchPhrase: lowerCase,
              originalPhrase: event.searchPhrase,
            ));
    }
  }

  EventTransformer<Event> debounceSequential<Event>(Duration duration) => (events, mapper) =>
      events.throttleTime(duration, leading: false, trailing: true).asyncExpand(mapper);

  @override
  Future<void> close() {
    _cityBlocSubscription.cancel();
    return super.close();
  }
}
