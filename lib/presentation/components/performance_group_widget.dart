import 'package:flutter/material.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/performance_group_heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';
import 'package:odyssey_mobile/presentation/components/show_more_button.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart' as pfg_entity;

class PerformanceGroupWidget extends StatefulWidget {
  const PerformanceGroupWidget({
    required this.performanceGroup,
    required this.categoryEntity,
    required this.secretWidth,
    Key? key,
  }) : super(key: key);

  final pfg_entity.PerformanceGroup performanceGroup;
  final ScheduleCategoryEntity categoryEntity;
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

  int itemCounter(int _count) => _count < 3 ? _count : 3;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PerformanceGroupHeading(widget.categoryEntity, widget.performanceGroup),
        AnimatedList(
          key: _listKey,
          initialItemCount: _initialCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (c, i, animation) => SizeTransition(
            sizeFactor: animation,
            child: PerformanceCard(
              performance: performances[i],
              secretWidth: widget.secretWidth,
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
