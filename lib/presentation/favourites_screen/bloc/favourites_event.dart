part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class _ExternalRefresh extends FavouritesEvent {
  const _ExternalRefresh(this.state);
  final CityDataState state;

  @override
  List<Object> get props => [state];
}

class _ExternalFavUpdate extends FavouritesEvent {
  const _ExternalFavUpdate(this.performance);
  final Performance performance;

  @override
  List<Object> get props => [performance];
}
