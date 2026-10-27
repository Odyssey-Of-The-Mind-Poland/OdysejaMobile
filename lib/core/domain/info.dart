abstract class Info {
  int get number;

  String get infoName;

  String get infoText;
  int get sortNumber;

  /// Icon key (e.g. `map-01`) and accent colour key (e.g. `blue`); null when not styled.
  String? get icon;
  String? get color;
}
