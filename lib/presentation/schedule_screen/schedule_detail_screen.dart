import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_filter_bloc.dart';

@RoutePage()
class ScheduleDetailScreen extends StatelessWidget {
  const ScheduleDetailScreen({required this.categoryEntity, super.key});
  final ScheduleCategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleFilterBloc(categoryEntity, context.read<CityDataBloc>()),
      child: BlocBuilder<ScheduleFilterBloc, CityDataState>(
        builder: (context, state) {
          if (state is ScheduleFilterSuccess) {
            return ScheduleLayout(
              days: state.days,
              performanceGroups: state.performanceGroups,
              title: categoryEntity.title,
              categoryEntity: categoryEntity,
            );
          } else if (state is CityDataError) {
            return ErrorBody(state.failure);
          }
          return const Loader();
        },
      ),
    );
  }
}
