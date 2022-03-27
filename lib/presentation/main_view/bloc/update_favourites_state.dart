part of 'update_favourites_bloc.dart';

abstract class UpdateFavouritesState {
  const UpdateFavouritesState();
}

class UpdateFavouritesInitial extends UpdateFavouritesState {
  const UpdateFavouritesInitial();
}

class UpdateFavouritesSuccess extends UpdateFavouritesState {
  const UpdateFavouritesSuccess(this.performance);
  final Performance performance;
}

class UpdateFavouritesError extends UpdateFavouritesState {
  const UpdateFavouritesError(this.failure);
  final Failure failure;
}
