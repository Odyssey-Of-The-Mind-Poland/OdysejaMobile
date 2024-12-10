import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
    return BlocBuilder<CityDataBloc, CityDataState>(
      builder: (context, cityState) {
        if (cityState is CityDataSuccess) {
          final allPerformances = cityState.cityData.performanceGroups
              .expand((group) => group.performances)
              .toList();

          return BlocBuilder<FavouritesBloc, CityDataState>(
            builder: (context, favState) {
              final now = DateTime.now();

              Performance? closestFavorite;
              if (favState is FavouritesSuccess) {
                closestFavorite = _getClosestPerformance(favState.favourites, now);
              }

              final closestPerformance =
                  closestFavorite ?? _getClosestPerformance(allPerformances, now);

              if (closestPerformance != null) {
                return _buildPerformanceWidget(closestPerformance);
              }

              return _noUpcomingPerformancesWidget();
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Performance? _getClosestPerformance(List<Performance> performances, DateTime now) {
    final upcomingPerformances = performances.where((p) {
      final performanceTime = _parseTime(p.performance);
      return performanceTime != null;
    }).toList();

    if (upcomingPerformances.isEmpty) return null;

    return upcomingPerformances.reduce((a, b) {
      final aTime = _parseTime(a.performance)!;
      final bTime = _parseTime(b.performance)!;
      return aTime.isBefore(bTime) ? a : b;
    });
  }

  Widget _noUpcomingPerformancesWidget() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Text(
        'Brak nadchodzących występów',
        style: AppTextStyles.regular,
      ),
    );
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
                  'Najbliższy występ',
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
                  '${performance.stage} • ${performance.problem} • ${performance.age}', // Additional details
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

  DateTime? _parseTime(String time) {
    try {
      final now = DateTime.now();
      final parsedTime = DateFormat('HH:mm').parse(time);
      return DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
      );
    } catch (e) {
      return null;
    }
  }
}
