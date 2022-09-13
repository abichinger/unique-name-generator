import 'package:unique_name_generator/src/dict/dict.dart' as dict;

abstract class Dictionary {
  operator [](int i);
  int get length;
}

class ListDictionary implements Dictionary {
  final List<String> words;

  const ListDictionary(this.words);

  @override
  String operator [](int i) {
    return words[i];
  }

  @override
  int get length => words.length;
}

class NumberDictionary implements Dictionary {
  int start;
  int end;

  NumberDictionary(this.start, this.end);

  @override
  String operator [](int i) {
    if (i >= length) {
      throw IndexError(i, this);
    }
    return '${start + i}';
  }

  @override
  int get length => end - start + 1;
}

const Dictionary adjectives = ListDictionary(dict.adjectives);
const Dictionary animals = ListDictionary(dict.animals);
const Dictionary colors = ListDictionary(dict.colors);
const Dictionary countries = ListDictionary(dict.countries);
const Dictionary languages = ListDictionary(dict.languages);
const Dictionary names = ListDictionary(dict.names);
const Dictionary starwars = ListDictionary(dict.starwars);
