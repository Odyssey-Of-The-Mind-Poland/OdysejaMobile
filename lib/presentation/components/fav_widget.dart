import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/app/themes.dart';

class FavWidget extends StatefulWidget {
  const FavWidget(
    this.isFavourite, {
    required this.controller,
    required this.secretWidth,
    required this.height,
    Key? key,
  }) : super(key: key);

  final bool isFavourite;
  final AnimationController controller;
  final double secretWidth;
  final double height;

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> with SingleTickerProviderStateMixin {
  late final Animation<Color?> animation;
  late final AnimationController controller;
  bool isDone = false;
  late bool isFavourite = false;

  final tweenSequencesFav = [
    TweenSequenceItem(
        tween: ColorTween(begin: AppColors.primaryOrange, end: AppColors.mediumGrey), weight: 1),
    TweenSequenceItem(
        tween: ColorTween(begin: AppColors.mediumGrey, end: AppColors.darkestBlue), weight: 1),
  ];
  final tweenSequencesNotFav = [
    TweenSequenceItem(
        tween: ColorTween(begin: AppColors.darkestBlue, end: AppColors.mediumGrey), weight: 1),
    TweenSequenceItem(
        tween: ColorTween(begin: AppColors.mediumGrey, end: AppColors.primaryOrange), weight: 1),
  ];
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: AppValues.defaultAnimationDuration);
    isFavourite = widget.isFavourite;
    final colorTween =
        TweenSequence<Color?>(widget.isFavourite ? tweenSequencesFav : tweenSequencesNotFav);
    animation = colorTween.animate(controller);
    widget.controller.addStatusListener(_listener);
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed && !isDone) {
      isDone = true;
      isFavourite = !isFavourite;
      controller.forward();
      // setState(() {
      // });
    }
  }

  @override
  void dispose() {
    widget.controller.removeStatusListener(_listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                alignment: Alignment.center,
                // -1 to hide the widget below upper layer.
                height: widget.height - 1,
                width: widget.secretWidth,
                decoration: BoxDecoration(
                  color: animation.value,
                  borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
                ),
                child: AnimatedSwitcher(
                  duration: AppValues.defaultAnimationDuration,
                  child: isFavourite
                      ? const Icon(OotmIcons.favFilled, color: AppColors.pureWhite, key: Key('1'))
                      : const Icon(OotmIcons.favEmpty, color: AppColors.pureWhite, key: Key('2')),
                ),
              );
            }));
  }
}
// isDone
//                       ? isFavourite
//                           ? AppColors.primaryOrange
//                           : AppColors.darkestBlue
//                       : 