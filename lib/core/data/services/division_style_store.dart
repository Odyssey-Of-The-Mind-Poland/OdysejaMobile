import 'dart:convert';

import 'package:odyssey_mobile/core/data/api/models/age.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Keeps the style editors gave to the age groups (the server sends it separately from the schedule),
/// so the divisions can be drawn with it. Without a stored style they look like they always did.
class DivisionStyleStore {
  DivisionStyleStore(this._prefs);

  final SharedPreferences _prefs;

  static const storageKey = 'division_styles';

  List<DivisionEntity> get divisions => divisionsWithStyles(_read());

  Future<void> save(List<AgeModelApi> ages) => _prefs.setString(
        storageKey,
        jsonEncode({
          for (final age in ages) '${age.id}': {'icon': age.icon, 'color': age.color},
        }),
      );

  Map<int, ({String? icon, String? color})> _read() {
    final raw = _prefs.getString(storageKey);
    if (raw == null) return const {};
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      return {
        for (final entry in decoded.entries)
          if (int.tryParse(entry.key) != null)
            int.parse(entry.key): (
              icon: (entry.value as Map<String, dynamic>)['icon'] as String?,
              color: (entry.value as Map<String, dynamic>)['color'] as String?,
            ),
      };
    } catch (_) {
      return const {};
    }
  }
}
