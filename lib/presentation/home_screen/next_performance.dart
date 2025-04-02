import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';

import '../../core/domain/performance.dart';
import '../favourites_screen/bloc/favourites_bloc.dart';
import '../main_view/bloc/city_data_bloc.dart';

class NextPerformance extends StatefulWidget {
  const NextPerformance({super.key});

  @override
  State<NextPerformance> createState() => _NextPerformanceState();
}

class _NextPerformanceState extends State<NextPerformance> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Timer? _timer;
  Performance? _closestPerformance;
  List<Performance> _favourites = [];
  _NextPerformanceBody? _cachedPerformanceWidget;

  @override
  Widget build(BuildContext context) {
    final closestPerformance = _closestPerformance;
    if (closestPerformance != null) {
      _cachedPerformanceWidget = _NextPerformanceBody(performance: closestPerformance);
    }

    return BlocListener<FavouritesBloc, CityDataState>(
      listener: (context, state) {
        if (state is FavouritesSuccess) {
          _favourites = state.favourites;
          _setClosestPerformance();
        }
      },
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: _cachedPerformanceWidget,
      ),
    );
  }

  _setClosestPerformance() {
    final now = DateTime.now();
    final closest = _favourites
        .where((p) => p.performanceDate.isAfter(now))
        .nullifyEmpty()
        ?.reduce((a, b) => a.performanceDate.isBefore(b.performanceDate) ? a : b);

    if (_closestPerformance == closest) return;

    setState(() {
      _timer?.cancel();
      _closestPerformance = closest;
      if (closest != null) {
        _controller.forward();
        _timer = Timer(
          _timeToRefresh(now: now, performance: closest.performanceDate),
          _setClosestPerformance,
        );
      } else {
        _controller.reverse();
      }
    });
  }

  Duration _timeToRefresh({required DateTime now, required DateTime performance}) =>
      Duration(minutes: 2) + performance.difference(now);
}

class _NextPerformanceBody extends StatelessWidget {
  const _NextPerformanceBody({required this.performance});

  final Performance performance;

  static const _fallbackBorderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).t;
    final theme = Theme.of(context).extension<OotmCommonTheme>();
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme?.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: theme?.borderColor ?? _fallbackBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.nextPerformance,
            style: typography.bodySmallRegular,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Expanded(
                child: Text(
                  performance.team,
                  style: typography.bodyMediumBold?.copyWith(color: theme?.primaryColor),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              Text(
                performance.performance,
                style: typography.h1?.copyWith(color: theme?.primaryColor),
              ),
            ],
          ),
          Text(
            CohortHelper.fromPerformance(performance).format(),
            style: typography.bodySmallRegular?.copyWith(color: theme?.textLighterColor),
          ),
        ],
      ),
    );
  }
}

extension NullifyEmptyIterable<T> on Iterable<T> {
  Iterable<T>? nullifyEmpty() => isEmpty ? null : this;
}
