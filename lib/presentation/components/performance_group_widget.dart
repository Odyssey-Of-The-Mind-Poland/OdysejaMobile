import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';
import 'package:odyssey_mobile/presentation/components/show_more_button.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart' as pfg_entity;
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';

class PerformanceGroupWidget extends StatefulWidget {
  const PerformanceGroupWidget({
    required this.performanceGroup,
    required this.secretWidth,
    this.categoryEntity,
    super.key,
  });

  final pfg_entity.PerformanceGroup performanceGroup;
  final ScheduleCategoryEntity? categoryEntity;
  final double secretWidth;

  @override
  State<PerformanceGroupWidget> createState() => _PerformanceGroupWidgetState();
}

class _PerformanceGroupWidgetState extends State<PerformanceGroupWidget>
    with AutomaticKeepAliveClientMixin {
  final _listKey = GlobalKey<AnimatedListState>();

  List<Performance> get performances => widget.performanceGroup.performances;
  late final int _initialCount;
  late int _listLength;

  @override
  void initState() {
    super.initState();
    _listLength = performances.length;
    _initialCount = itemCounter(_listLength);
  }

  int itemCounter(int count) => count < 3 ? count : 3;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Heading(
            CohortHelper.fromPerformanceGroup(widget.performanceGroup)
                .format(widget.categoryEntity),
          ),
        ),
        AnimatedList(
          key: _listKey,
          initialItemCount: _initialCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (c, i, animation) => SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: PerformanceCard(
                performance: performances[i],
                secretWidth: widget.secretWidth,
              ),
            ),
          ),
        ),
        if (_listLength > 3)
          Center(
            child: ShowMoreButton(
              expanded: expanded,
              initialExpanded: false,
            ),
          )
      ],
    );
  }

  void expanded(bool value) async {
    if (value) {
      for (int i = _initialCount; i < _listLength; ++i) {
        _listKey.currentState?.insertItem(i);
      }
    } else {
      for (int i = _listLength - 1; i >= _initialCount; --i) {
        _listKey.currentState?.removeItem(
            i,
            (context, animation) => SizeTransition(
                  sizeFactor: animation,
                  child: PerformanceCard(
                    performance: performances[i],
                    secretWidth: widget.secretWidth,
                  ),
                ));
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
