import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/core/data/api/models/age.dart';
import 'package:odyssey_mobile/core/data/services/division_style_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<SharedPreferences> prefs([Map<String, Object> values = const {}]) async {
    SharedPreferences.setMockInitialValues(values);
    return SharedPreferences.getInstance();
  }

  test('without stored styles the five divisions look as before', () async {
    final divisions = DivisionStyleStore(await prefs()).divisions;

    expect(divisions.map((d) => d.number), [0, 1, 2, 3, 4]);
    expect(divisions.every((d) => d.icon == null && d.color == null), isTrue);
  });

  test('stored styles are applied to the matching age group only', () async {
    final preferences = await prefs();
    final store = DivisionStyleStore(preferences);

    await store.save([
      AgeModelApi(id: 0, icon: 'star-01', color: 'purple'),
      AgeModelApi(id: 3, color: 'green'),
      AgeModelApi(id: 4),
    ]);

    final divisions = DivisionStyleStore(preferences).divisions;
    expect(divisions[0].icon, 'star-01');
    expect(divisions[0].color, 'purple');
    expect(divisions[3].icon, isNull);
    expect(divisions[3].color, 'green');
    expect(divisions[4].color, isNull);
    expect(divisions[1].color, isNull);
  });

  test('unreadable stored data is ignored', () async {
    final divisions = DivisionStyleStore(await prefs({DivisionStyleStore.storageKey: 'not json'})).divisions;

    expect(divisions.every((d) => d.color == null), isTrue);
  });
}
