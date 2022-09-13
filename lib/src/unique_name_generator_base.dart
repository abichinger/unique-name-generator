import 'dart:math';

import 'package:unique_name_generator/src/dictionary.dart';
import 'package:unique_name_generator/src/styles.dart';

/// Checks if you are awesome. Spoiler: you are.
class UniqueNameGenerator {
  List<Dictionary> dictionaries;
  String separator;
  NameStyle style;

  UniqueNameGenerator({
    required this.dictionaries,
    this.separator = '_',
    this.style = NameStyle.lowerCase,
  });

  String generate({int? seed}) {
    List<String> words = <String>[];

    for (Dictionary d in dictionaries) {
      int rnd;
      if (seed != null) {
        rnd = Random(seed).nextInt(d.length);
        seed = (Random(seed).nextDouble() * 4294967296).floor();
      } else {
        rnd = Random().nextInt(d.length);
      }

      String word = d[rnd];
      if (style == NameStyle.lowerCase) {
        word = word.toLowerCase();
      } else if (style == NameStyle.upperCase) {
        word = word.toUpperCase();
      } else if (style == NameStyle.capital) {
        word = word[0].toUpperCase() + word.substring(1).toLowerCase();
      }

      words.add(word);
    }

    return words.join(separator);
  }
}
