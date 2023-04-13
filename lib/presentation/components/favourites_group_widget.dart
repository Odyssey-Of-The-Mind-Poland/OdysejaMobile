import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/performance_group_heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
// import 'package:odyssey_mobile/presentation/components/show_more_button.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class FavouritesGroupWidget extends StatefulWidget {
  const FavouritesGroupWidget({
    required this.performanceGroup,
    required this.secretWidth,
    this.categoryEntity,
    Key? key,
  }) : super(key: key);

  final PerformanceGroup performanceGroup;
  final ScheduleCategoryEntity? categoryEntity;
  final double secretWidth;

  @override
  State<FavouritesGroupWidget> createState() => _FavouritesGroupWidgetState();
}

class _FavouritesGroupWidgetState extends State<FavouritesGroupWidget>
    with AutomaticKeepAliveClientMixin {
  final _listKey = GlobalKey<AnimatedListState>();
  List<Performance> get performances => widget.performanceGroup.performances;

  bool expanded = false;

  int itemCounter(int count) => count < 3 ? count : 3;

  // TODO: check!
  /// Widget work on an assumtion, that performance idexes (from API) can be safely used
  /// for sorting
  void addItem(Performance pf) {
    int index = performances.indexWhere((e) => e.performanceId > pf.performanceId);
    final i = index == -1 ? performances.length : index;
    performances.insert(i, pf);
    _listKey.currentState?.insertItem(i);
  }

  void removeItem(Performance pf) {
    final i = performances.indexWhere((e) => e.performanceId == pf.performanceId);
    if (i != -1) {
      _removeItem(pf, i);
      performances.removeAt(i);
    }
  }

  void _removeItem(Performance pf, int i) => _listKey.currentState?.removeItem(
      i,
      (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: PerformanceCard(
              performance: pf,
              secretWidth: widget.secretWidth,
            ),
          ));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
      // Out of desperation...
      // Refactor with list of ids or better BLoC.
      listenWhen: (_, c) =>
          c is UpdateFavouritesSuccess &&
          c.performance.age == widget.performanceGroup.age &&
          c.performance.problem == widget.performanceGroup.problem &&
          c.performance.stage == widget.performanceGroup.stage &&
          c.performance.part == widget.performanceGroup.part &&
          c.performance.performanceDay == widget.performanceGroup.day,
      listener: (context, state) {
        if (state is UpdateFavouritesSuccess) {
          if (state.performance.isFavourite) {
            addItem(state.performance);
          } else {
            removeItem(state.performance);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: PerformanceGroupHeading(widget.performanceGroup,
                categoryEntity: widget.categoryEntity),
          ),
          AnimatedList(
            key: _listKey,
            initialItemCount: performances.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i, animation) => SizeTransition(
              sizeFactor: animation,
              child: PerformanceCard(
                key: Key('${performances[i].performanceId}'),
                performance: performances[i],
                secretWidth: widget.secretWidth,
              ),
            ),
          ),
          // if (performances.length > 3)
          //   Center(
          //     child: ShowMoreButton(
          //       expanded: _onExpanding,
          //       initialExpanded: expanded,
          //     ),
          //   )
        ],
      ),
    );
  }

  // void _onExpanding(bool value) async {
  //   if (value) {
  //     expanded = true;
  //     for (int i = 3; i < performances.length; ++i) {
  //       _listKey.currentState?.insertItem(i);
  //     }
  //   } else {
  //     expanded = false;
  //     for (int i = performances.length - 1; i >= 3; --i) {
  //       _removeItem(performances[i], i);
  //     }
  //   }
  // }

  @override
  bool get wantKeepAlive => true;
}
