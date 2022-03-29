part of 'schedule_search_bloc.dart';

abstract class ScheduleSearchState {
  const ScheduleSearchState();
}

class SearchResult extends ScheduleSearchState {
  const SearchResult(
      {required this.performances, required this.searchPhrase, required this.originalPhrase});
  final List<Performance> performances;
  final String searchPhrase;
  final String originalPhrase;
}

class SearchEmpty extends ScheduleSearchState {
  const SearchEmpty();
}

class SearchInitial extends ScheduleSearchState {
  const SearchInitial();
}
