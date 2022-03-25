part of 'update_favourites_bloc.dart';

abstract class UpdateFavouritesEvent {
  const UpdateFavouritesEvent();
}

class Update extends UpdateFavouritesEvent {
  const Update(this.performance);
  final Performance performance;
}

class Toggle extends UpdateFavouritesEvent {
  const Toggle(this.performance);
  final Performance performance;
}
