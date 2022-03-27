import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, CityDataState> {
  FavouritesBloc(@factoryParam this._cityBloc, @factoryParam this._favUpdateBloc)
      : super(const CityDataLoading()) {
    on<_ExternalRefresh>(_externalRefreshHandler);
    on<_ExternalFavUpdate>(_externalFavUpdateHandler);

    _cityBlocSubscription = _cityBloc.stream.listen((state) => add(_ExternalRefresh(state)));
    add(_ExternalRefresh(_cityBloc.state));

    _favUpdateBlocSubscription = _favUpdateBloc.stream.listen((state) {
      if (state is UpdateFavouritesSuccess) {
        add(_ExternalFavUpdate(state.performance));
      }
    });
  }
  late List<PerformanceGroup> _performanceGroups;
  final CityDataBloc _cityBloc;
  final UpdateFavouritesBloc _favUpdateBloc;
  late final StreamSubscription _cityBlocSubscription;
  late final StreamSubscription _favUpdateBlocSubscription;

  void _externalFavUpdateHandler(_ExternalFavUpdate event, Emitter<CityDataState> emit) {
    if (state is FavouritesSuccess) {
      _performanceGroups[0];
      final data = _extractFavs(_performanceGroups);
      emit(FavouritesSuccess(data));
    }
  }

  void _externalRefreshHandler(_ExternalRefresh event, Emitter<CityDataState> emit) {
    if (event.state.runtimeType == CityDataSuccess) {
      _performanceGroups = (event.state as CityDataSuccess).cityData.performanceGroups;
      final data = _extractFavs(_performanceGroups);
      emit(FavouritesSuccess(data));
    } else {
      emit(event.state);
    }
  }

  List<PerformanceGroup> _extractFavs(List<PerformanceGroup> pfGroups) => pfGroups
      .map((pg) => pg.copyWith(performances: pg.performances.where((p) => p.isFavourite).toList()))
      .where((pg) => pg.performances.isNotEmpty)
      .toList();

  @override
  Future<void> close() {
    _cityBlocSubscription.cancel();
    _favUpdateBlocSubscription.cancel();
    return super.close();
  }
}
