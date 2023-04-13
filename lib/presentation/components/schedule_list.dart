import 'package:flutter/material.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/performance_group_widget.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList(
      {Key? key, required this.groups, required this.categoryEntity, required this.secretWidth})
      : super(key: key);

  final List<PerformanceGroup> groups;
  final ScheduleCategoryEntity? categoryEntity;
  final double secretWidth;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: widget.groups.length,
      itemBuilder: (_, i) => PerformanceGroupWidget(
        performanceGroup: widget.groups[i],
        categoryEntity: widget.categoryEntity,
        secretWidth: widget.secretWidth,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
