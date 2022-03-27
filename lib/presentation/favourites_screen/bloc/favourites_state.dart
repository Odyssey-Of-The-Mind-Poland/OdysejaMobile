part of 'favourites_bloc.dart';

abstract class FavouritesState extends CityDataState {
  const FavouritesState();
}

class FavouritesSuccess extends FavouritesState {
  const FavouritesSuccess(this.performanceGroups);
  final List<PerformanceGroup> performanceGroups;

  List<String> get days =>
      performanceGroups.map((e) => e.day).toSet().toList()..sort((a, b) => b.compareTo(a));

  int get count =>
      performanceGroups.fold<int>(0, (previousValue, e) => previousValue + e.performances.length);
}
