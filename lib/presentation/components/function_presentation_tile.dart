import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';

class FunctionPresentationTile extends StatelessWidget {
  const FunctionPresentationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color iconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.biggerBrRadius),
            color: iconBackgroundColor,
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.subtitle1.copyWith(fontSize: 18)),
              const SizedBox(height: 8.0),
              Text(subtitle, style: AppTextStyles.bodyText2)
            ],
          ),
        ),
      ],
    );
  }
}
