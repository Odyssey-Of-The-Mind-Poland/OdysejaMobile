import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/themes.dart';

import '../../domain/entities/performance.dart';
import '../favourites_screen/bloc/favourites_bloc.dart';
import '../main_view/bloc/city_data_bloc.dart';

class NextPerformance extends StatefulWidget {
  const NextPerformance({super.key});

  @override
  State<NextPerformance> createState() => _NextPerformanceState();
}

class _NextPerformanceState extends State<NextPerformance> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, CityDataState>(
      builder: (context, favState) {
        final now = DateTime.now();

        Performance? closestFavorite;
        if (favState is FavouritesSuccess) {
          closestFavorite = _getClosestPerformance(favState.favourites, now);
        }

        final closestPerformance = closestFavorite;

        if (closestPerformance != null) {
          return _buildPerformanceWidget(closestPerformance);
        }

        return SizedBox.shrink();
      },
    );
  }

  Performance? _getClosestPerformance(
      List<Performance> performances, DateTime now) {
    final upcomingPerformances = performances.where((p) {
      final fullDateTime = p.getPerofrmanceDateTime();
      return fullDateTime != null && fullDateTime.isAfter(now);
    }).toList();

    if (upcomingPerformances.isEmpty) return null;

    return upcomingPerformances.reduce((a, b) {
      final aDateTime = a.getPerofrmanceDateTime()!;
      final bDateTime = b.getPerofrmanceDateTime()!;
      return aDateTime.isBefore(bDateTime) ? a : b;
    });
  }

  Widget _buildPerformanceWidget(Performance performance) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.bigBrRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(color: AppColors.pureWhite),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Najbliższy występ w ulubionych',
                  style: AppTextStyles.regular,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        performance.team,
                        style: AppTextStyles.h4orange,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Text(
                      performance.performance,
                      style: AppTextStyles.h1orange,
                    ),
                  ],
                ),
                Text(
                  'Scena ${performance.stage} • Problem ${performance.problem} • Gr. wiekowa ${performance.age}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mediumGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
