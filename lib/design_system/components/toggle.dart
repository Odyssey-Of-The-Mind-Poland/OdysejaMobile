import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Pill switch (56x32) of the design system.
class OotmToggle extends StatelessWidget {
  const OotmToggle({required this.value, required this.onChanged, super.key});

  final bool value;
  final ValueChanged<bool>? onChanged;

  static const _duration = Duration(milliseconds: 180);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;
    final buttons = theme.extension<OotmMainButtonTheme>()!;

    final track = value ? buttons.primaryBackground! : common.borderColor!;
    final thumb = value ? buttons.primaryForeground! : theme.c.universal.grey.color100!;

    return Semantics(
      toggled: value,
      enabled: onChanged != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeOut,
          width: 56,
          height: 32,
          padding: const EdgeInsets.all(4),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(color: track, borderRadius: BorderRadius.circular(80)),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: thumb, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
