import 'package:flutter/material.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

class ShowMoreButton extends StatefulWidget {
  const ShowMoreButton({required this.expanded, required this.initialExpanded, super.key});
  final ValueChanged<bool> expanded;
  final bool initialExpanded;

  @override
  State<ShowMoreButton> createState() => _ShowMoreButtonState();
}

class _ShowMoreButtonState extends State<ShowMoreButton> {
  late bool _expanded;
  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.lightestOrange,
          borderRadius: BorderRadius.circular(AppValues.ultraBrRadius)),
      child: InkWell(
        splashColor: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(AppValues.ultraBrRadius),
        onTap: () => setState(() {
          _expanded = !_expanded;
          widget.expanded(_expanded);
        }),
        child: Ink(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // TODO check issues with displaced decoration on list animation
            // decoration: BoxDecoration(
            //   color: AppColors.lightestOrange,
            //   borderRadius: BorderRadius.circular(AppValues.ultraBrRadius),
            // ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _expanded
                    ? const [
                        Text(AppStrings.performanceGroupButtonExpanded,
                            maxLines: 1, style: AppTextStyles.h4orange),
                        Icon(OotmIcons.chevronUp, color: AppColors.primaryOrange)
                      ]
                    : const [
                        Text(AppStrings.performanceGroupButtonExpand,
                            maxLines: 1, style: AppTextStyles.h4orange),
                        Icon(OotmIcons.chevronDown, color: AppColors.primaryOrange)
                      ])),
      ),
    );
  }
}
