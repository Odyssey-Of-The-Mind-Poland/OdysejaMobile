import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class PerformanceDialog extends StatefulWidget {
  const PerformanceDialog(this.performance, {required this.bloc, Key? key}) : super(key: key);
  final Performance performance;
  final UpdateFavouritesBloc bloc;
  @override
  State<PerformanceDialog> createState() => _PerformanceDialogState();
}

class _PerformanceDialogState extends State<PerformanceDialog> {
  Performance get pf => widget.performance;
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.performance.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if (state is UpdateFavouritesError) {
          showSnackBar(context: context, text: state.failure.errorMessage);
        } else if (state is UpdateFavouritesSuccess) {
          setState(() {
            isFavourite = state.performance.isFavourite;
          });
        }
      },
      listenWhen: (_, c) =>
          c is UpdateFavouritesSuccess &&
          c.performance.performanceId == widget.performance.performanceId,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
            color: AppColors.pureWhite,
          ),
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  pf.team,
                  style: isFavourite
                      ? AppTextStyles.h3.copyWith(color: AppColors.primaryOrange)
                      : AppTextStyles.h3,
                  textAlign: TextAlign.center,
                ),
                _PerformanceDialogStaticInfo(widget.performance),
                ElevatedButton.icon(
                  onPressed: () =>
                      widget.bloc.add(Update(widget.performance..isFavourite = !isFavourite)),
                  icon: isFavourite
                      ? const Icon(OotmIcons.favFilled)
                      : const Icon(OotmIcons.favEmpty),
                  label: isFavourite
                      ? const Text(AppStrings.removeFromFavsLabel)
                      : const Text(AppStrings.close),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: context.router.pop,
                  child: const Text(AppStrings.close),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.lightGrey, onPrimary: AppColors.darkestGrey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PerformanceDialogStaticInfo extends StatelessWidget {
  const _PerformanceDialogStaticInfo(this.pf, {Key? key}) : super(key: key);
  final Performance pf;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Text([_stage, _age, _problem].join(' • ')),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DayWidget(
                  day: pf.performanceDay,
                  hour: pf.performance,
                  type: AppStrings.performance,
                  toolTip: AppStrings.performanceToolTip,
                ),
                _DayWidget(
                  day: pf.spontanDay,
                  hour: pf.spontan,
                  type: AppStrings.spontan,
                  toolTip: AppStrings.spontanToolTip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String get _problem => '${AppStrings.problem} ${pf.problem}';
  String get _age => '${AppStrings.age} ${AppStrings.divisionSymbols[pf.age]}';
  String get _stage => '${AppStrings.stage} ${pf.stage}';
}

class _DayWidget extends StatelessWidget {
  const _DayWidget(
      {Key? key, required this.day, required this.hour, required this.type, required this.toolTip})
      : super(key: key);

  final String day;
  final String hour;
  final String type;
  final String toolTip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        // fake Inkwell
        onTap: () {},
        child: Tooltip(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
            color: AppColors.darkestBlue,
          ),
          textStyle: AppTextStyles.subtitleWhite,
          padding: const EdgeInsets.all(16),
          triggerMode: TooltipTriggerMode.tap,
          message: toolTip,
          verticalOffset: 48,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(day, style: AppTextStyles.bodyText2),
                Text(hour, style: AppTextStyles.h1),
                Row(children: [
                  Text(type, style: AppTextStyles.h3),
                  const SizedBox(width: 2),
                  const Icon(OotmIcons.info, color: AppColors.darkestBlue),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
