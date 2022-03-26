import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
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
            return ScheduleLayout(
              days: state.days,
              performanceGroups: state.performanceGroups,
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
