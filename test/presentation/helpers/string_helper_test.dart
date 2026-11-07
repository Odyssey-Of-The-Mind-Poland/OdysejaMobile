import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';

void main() {
  group('StringHelper.removeOrphans', () {
    test('glues a single character to the next word', () {
      expect(StringHelper.removeOrphans('Sala w hali'), 'Sala w hali');
    });

    test('does not break on a name that ends with a two letter word', () {
      expect(() => StringHelper.removeOrphans('PPNT: SALA Da'), returnsNormally);
      expect(StringHelper.removeOrphans('PPNT: SALA Da'), 'PPNT: SALA Da');
    });

    test('leaves short strings alone', () {
      expect(StringHelper.removeOrphans(''), '');
      expect(StringHelper.removeOrphans('a'), 'a');
      expect(StringHelper.removeOrphans('ab'), 'ab');
    });
  });
}
