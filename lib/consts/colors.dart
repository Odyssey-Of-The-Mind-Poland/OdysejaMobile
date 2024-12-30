import 'dart:ui';

abstract class Colors {
  UniversalColors get universal;

  ColorSet get primary;

  AccentColors get accent;
}

class UniversalColors {
  final ColorSet grey;
  final ColorSet blue;
  final ColorSet green;
  final ColorSet red;

  const UniversalColors({
    required this.grey,
    required this.blue,
    required this.green,
    required this.red,
  });
}

class AccentColors {
  final ColorSet blue;
  final ColorSet orange;
  final ColorSet red;
  final ColorSet purple;

  const AccentColors({
    required this.blue,
    required this.orange,
    required this.red,
    required this.purple,
  });
}

class ColorSet {
  final Color color100;
  final Color? color200;
  final Color color300;
  final Color? color400;
  final Color color500;
  final Color? color600;
  final Color color700;

  const ColorSet({
    required this.color100,
    this.color200,
    required this.color300,
    this.color400,
    required this.color500,
    this.color600,
    required this.color700,
  });


  Color? operator [](int level) {
    switch (level) {
      case 100:
        return color100;
      case 200:
        return color200;
      case 300:
        return color300;
      case 400:
        return color400;
      case 500:
        return color500;
      case 600:
        return color600;
      case 700:
        return color700;
      default:
        throw ArgumentError('Invalid color level: $level');
    }
  }
}
