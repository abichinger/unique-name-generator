import 'package:test/test.dart';
import 'package:unique_name_generator/unique_name_generator.dart';

void main() {
  group('dictionaries', () {
    test('ListDictionary', () {
      final dict = ListDictionary(['alice', 'bob', 'john']);

      expect(dict[0], equals('alice'));
      expect(dict[2], equals('john'));
      expect(dict.length, equals(3));
    });

    test('NumberDictionary', () {
      final dict = NumberDictionary(100, 999);

      expect(dict[0], equals('100'));
      expect(dict[100], equals('200'));
      expect(dict[dict.length - 1], equals('999'));
    });
  });

  group('UniqueNameGenerator', () {
    final angry = ListDictionary(['angry']);
    final bird = ListDictionary(['bird']);

    test('seperator', () {
      var generator = UniqueNameGenerator(
        dictionaries: [angry, bird],
      );

      expect(generator.generate(), 'angry_bird');

      generator.separator = '';
      expect(generator.generate(), 'angrybird');

      generator.separator = '++';
      expect(generator.generate(), 'angry++bird');
    });

    test('styles', () {
      var generator = UniqueNameGenerator(
        dictionaries: [angry, bird],
        separator: '-',
      );

      generator.style = NameStyle.lowerCase;
      expect(generator.generate(), 'angry-bird');

      generator.style = NameStyle.upperCase;
      expect(generator.generate(), 'ANGRY-BIRD');

      generator.style = NameStyle.capital;
      expect(generator.generate(), 'Angry-Bird');
    });

    test('seed', () {
      var generator = UniqueNameGenerator(
        dictionaries: [adjectives, animals],
        separator: '',
        style: NameStyle.capital,
      );

      expect(generator.generate(seed: 123), generator.generate(seed: 123));
      expect(
          generator.generate(seed: 123) != generator.generate(seed: 0), true);
    });
  });
}
