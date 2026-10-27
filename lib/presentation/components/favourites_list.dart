import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/design_system/components/timeline_item.dart';
import 'package:odyssey_mobile/presentation/components/favourites_group_widget.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_view_cubit.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';
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
    return BlocBuilder<FavouritesViewCubit, FavouritesView>(
      builder: (context, view) => BlocBuilder<FavouritesBloc, CityDataState>(
        buildWhen: (p, c) =>
            (p is FavouritesSuccess && c is FavouritesSuccess) &&
                (p.performanceGroups.length != c.performanceGroups.length) ||
            p is CityDataLoading,
        builder: (context, state) {
          if (state is! FavouritesSuccess) return const SizedBox();

          final dayGroups = widget.day == null
              ? state.performanceGroups
              : state.performanceGroups.where((el) => el.day == widget.day).toList();

          if (view.mode == FavouritesDisplayMode.timeline) {
            return _Timeline(performances: view.timeline(dayGroups));
          }

          final groups = view.apply(dayGroups)..sortGroups();
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: groups.length,
            itemBuilder: (_, i) => FavouritesGroupWidget(
              key: Key(groups[i].groupId.toString()),
              performanceGroup: groups[i],
              secretWidth: widget.secretWidth,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.performances});

  final List<Performance> performances;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: performances.length,
      itemBuilder: (context, i) {
        final performance = performances[i];
        return TimelineItem(
          time: performance.performance,
          title: performance.team,
          subtitle: CohortHelper.fromPerformance(performance).format(),
          emphasized: performance.performanceDate.isAfter(now),
          isFirst: i == 0,
          isLast: i == performances.length - 1,
        );
      },
    );
  }
}
