part of 'update_favourites_bloc.dart';

abstract class UpdateFavouritesState extends Equatable {
  const UpdateFavouritesState();

  @override
  List<Object> get props => [];
}

class UpdateFavouritesInitial extends UpdateFavouritesState {
  const UpdateFavouritesInitial();
}

class UpdateFavouritesSuccess extends UpdateFavouritesState {
  const UpdateFavouritesSuccess(this.performance);
  final Performance performance;

  @override
  List<Object> get props => [performance.performanceId, performance.isFavourite];
}

class UpdateFavouritesError extends UpdateFavouritesState {
  const UpdateFavouritesError(this.failure);
  final Failure failure;
}
