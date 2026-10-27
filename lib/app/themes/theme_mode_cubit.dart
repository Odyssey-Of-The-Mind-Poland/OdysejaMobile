import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds the user's preferred [ThemeMode] and persists it between launches.
///
/// Both [ThemeData] instances (light and dark) carry the same set of
/// [ThemeExtension]s, so switching modes only swaps token values - widgets
/// always read colors from `Theme.of(context)`.
class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit(this._prefs) : super(_read(_prefs));

  final SharedPreferences _prefs;

  static const storageKey = 'theme_mode';

  /// Until the whole app is migrated to the new design tokens, the app stays light
  /// unless the user explicitly picks another mode.
  static const defaultMode = ThemeMode.light;

  static ThemeMode _read(SharedPreferences prefs) {
    final stored = prefs.getString(storageKey);
    return ThemeMode.values.asNameMap()[stored] ?? defaultMode;
  }

  Future<void> setMode(ThemeMode mode) async {
    if (mode == state) return;
    emit(mode);
    await _prefs.setString(storageKey, mode.name);
  }
}
