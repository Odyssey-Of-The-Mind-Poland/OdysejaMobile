part of 'schedule_search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class _ExternalRefresh extends SearchEvent {
  const _ExternalRefresh(this.state);
  final CityDataState state;

  @override
  List<Object> get props => [state];
}

class SearchRequest extends SearchEvent {
  const SearchRequest(this.searchPhrase);
  final String searchPhrase;

  @override
  List<Object> get props => [searchPhrase];
}
