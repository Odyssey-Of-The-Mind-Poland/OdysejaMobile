import 'package:shared_preferences/shared_preferences.dart';

/// Remembers which city the user picked, so the app opens on it next time.
class SelectedCityStore {
  SelectedCityStore(this._prefs);

  final SharedPreferences _prefs;

  static const storageKey = 'selected_city_id';

  /// The finals; shown until the user picks another city.
  static const defaultCityId = 0;

  int get cityId => _prefs.getInt(storageKey) ?? defaultCityId;

  Future<void> save(int cityId) => _prefs.setInt(storageKey, cityId);
}
