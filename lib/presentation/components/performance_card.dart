import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/features/schedule/performance_bottom_sheet.dart';
import 'package:odyssey_mobile/presentation/components/fav_widget.dart';
import 'package:odyssey_mobile/presentation/components/shadows.dart';
import 'package:odyssey_mobile/presentation/components/spontaneous_widget.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';
import 'package:odyssey_mobile/widgets/snackbar.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class PerformanceCard extends StatefulWidget {
  const PerformanceCard({required this.performance, required this.secretWidth, super.key});
  final Performance performance;
  final double secretWidth;

  @override
  State<PerformanceCard> createState() => _PerformanceCardState();
}

class _PerformanceCardState extends State<PerformanceCard> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.performance.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTriggerCard(
      key: Key(widget.performance.performanceId.toString()),
      color: AppColors.pureWhite,
      horizontalPadding: 0,
      shadow: defaultShadow,
      verticalPadding: 0,
      borderRadius: AppValues.defaultBrRadius,
      direction: SwipeDirection.horizontal,
      swipeThreshold: AppValues.swipeTreshold,
      backgroundBuilder: (context, direction, progress) {
        if (direction == SwipeDirection.endToStart) {
          return SpontaneousWidget(
              performance: widget.performance, secretWidth: widget.secretWidth);
        } else if (direction == SwipeDirection.startToEnd) {
          return FavWidget(isFavourite, controller: progress, secretWidth: widget.secretWidth);
        }
        return const SizedBox();
      },
      onSwiped: (SwipeDirection direction) {
        if (direction == SwipeDirection.startToEnd) {
          context
              .read<UpdateFavouritesBloc>()
              .add(Update(widget.performance..isFavourite = !isFavourite));
        }
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Material(
          color: AppColors.pureWhite,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
            onTap: () => showOotmBottomSheet(
              context: context,
              useRootNavigator: true,
              child: PerformanceBottomSheet(
                performance: widget.performance,
                bloc: context.read<UpdateFavouritesBloc>(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
                listenWhen: (_, c) =>
                    c is UpdateFavouritesSuccess &&
                    c.performance.performanceId == widget.performance.performanceId,
                listener: (context, state) {
                  if (state is UpdateFavouritesError) {
                    showSnackBar(
                      context: context,
                      text: state.failure.errorMessage,
                      type: SnackBarType.error,
                    );
                  } else if (state is UpdateFavouritesSuccess) {
                    setState(() {
                      isFavourite = state.performance.isFavourite;
                    });
                  }
                },
                child: AnimatedSwitcher(
                  duration: AppValues.defaultAnimationDuration,
                  child: Row(
                    key: Key(isFavourite.toString()),
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            widget.performance.performance,
                            textAlign: TextAlign.center,
                            style: isFavourite
                                ? AppTextStyles.h2.copyWith(color: AppColors.primaryOrange)
                                : AppTextStyles.h2,
                          )),
                      Expanded(
                          child: Text(
                        widget.performance.team,
                        style: AppTextStyles.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                          width: 32,
                          child: Icon(
                            OotmIcons.chevronRight,
                            color: isFavourite ? AppColors.primaryOrange : null,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
