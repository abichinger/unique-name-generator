import 'package:unique_name_generator/unique_name_generator.dart';

void main() {
  final hashtag = ListDictionary(['#']);
  final numbers = NumberDictionary(1000, 9999);

  var ung = UniqueNameGenerator(
    dictionaries: [adjectives, animals, hashtag, numbers],
    style: NameStyle.capital,
    separator: '',
  );

  List<String> names = List.generate(10, (index) => ung.generate());
  print(names);
}
