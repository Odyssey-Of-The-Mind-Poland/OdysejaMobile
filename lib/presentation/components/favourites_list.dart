import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/presentation/components/favourites_group_widget.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';

class FavouritesList extends StatefulWidget {
  const FavouritesList({super.key, required this.secretWidth, this.day});
  final String? day;
  final double secretWidth;

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<FavouritesBloc, CityDataState>(
      buildWhen: (p, c) =>
          (p is FavouritesSuccess && c is FavouritesSuccess) &&
              (p.performanceGroups.length != c.performanceGroups.length) ||
          p is CityDataLoading,
      builder: (context, state) {
        if (state is FavouritesSuccess) {
          late final List<PerformanceGroup> groups;
          if (widget.day != null) {
            groups = state.performanceGroups.where((el) => el.day == widget.day).toList();
          } else {
            groups = state.performanceGroups;
          }
          groups.sortGroups();
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: groups.length,
            itemBuilder: (_, i) => FavouritesGroupWidget(
                key: Key(groups[i].groupId.toString()),
                performanceGroup: groups[i],
                secretWidth: widget.secretWidth),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
