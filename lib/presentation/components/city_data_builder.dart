import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/domain/failure.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';

class CityDataBuilder extends StatelessWidget {
  const CityDataBuilder({required this.onData, this.onFailure, Key? key}) : super(key: key);
  final Widget Function(CityData cityData, List<ScheduleCategoryEntity> problems) onData;
  final Widget Function(Failure failure)? onFailure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityDataBloc, CityDataState>(
      builder: (context, state) {
        if (state is CityDataSuccess) {
          return onData(state.cityData, state.problems);
        } else if (state is CityDataError) {
          return onFailure != null ? onFailure!(state.failure) : ErrorBody(state.failure);
        }
        return const Loader();
      },
    );
  }
}
