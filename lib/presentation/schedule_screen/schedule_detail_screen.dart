import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart' as entity;
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/performance_group.dart';
import 'package:odyssey_mobile/presentation/core/error_body.dart';
import 'package:odyssey_mobile/presentation/core/loader.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_filter_bloc.dart';

class ScheduleDetailScreen extends StatelessWidget {
  const ScheduleDetailScreen({required this.categoryEntity, Key? key}) : super(key: key);
  final ScheduleCategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleFilterBloc(categoryEntity, context.read<CityDataBloc>()),
      child: BlocBuilder<ScheduleFilterBloc, CityDataState>(
        builder: (context, state) {
          if (state is ScheduleFilterSuccess) {
            final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
            // TODO convert into CustomScrollView and slivers?
            final numDays = state.days.length;
            if (numDays > 1) {
              return DefaultTabController(
                length: numDays,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(categoryEntity.title),
                    centerTitle: true,
                    bottom: TabBar(tabs: state.days.map((e) => Text(e)).toList()),
                  ),
                  body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: state.days
                          .map((e) => ScheduleDetailsLiest(
                                categoryEntity: categoryEntity,
                                groups: state.performanceGroups.where((el) => el.day == e).toList(),
                                secretWidth: secretWidth,
                              ))
                          .toList()),
                ),
              );
            } else {
              return Scaffold(
                  appBar: AppBar(
                    title: Text(categoryEntity.title),
                    centerTitle: true,
                  ),
                  body: ScheduleDetailsLiest(
                    categoryEntity: categoryEntity,
                    groups: state.performanceGroups,
                    secretWidth: secretWidth,
                  ));
            }
          } else if (state is CityDataError) {
            return ErrorBody(state.failure);
          }
          return const Loader();
        },
      ),
    );
  }
}

class ScheduleDetailsLiest extends StatefulWidget {
  const ScheduleDetailsLiest(
      {Key? key, required this.groups, required this.categoryEntity, required this.secretWidth})
      : super(key: key);

  final List<entity.PerformanceGroup> groups;
  final ScheduleCategoryEntity categoryEntity;
  final double secretWidth;

  @override
  State<ScheduleDetailsLiest> createState() => _ScheduleDetailsLiestState();
}

class _ScheduleDetailsLiestState extends State<ScheduleDetailsLiest>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: widget.groups.length,
      itemBuilder: (_, i) => PerformanceGroup(
        performanceGroup: widget.groups[i],
        categoryEntity: widget.categoryEntity,
        secretWidth: widget.secretWidth,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
