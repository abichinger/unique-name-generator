<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A dart package to generate unique usernames based on dictionaries.

This library is a port of the node.js package [unique-names-generator
](https://www.npmjs.com/package/unique-names-generator#api) by [Andrea SonnY](https://github.com/andreasonny83/unique-names-generator)

## Features

- includes a [list of dictionaries](https://github.com/abichinger/unique-name-generator/tree/main/lib/src/dict)
- supports custom dictionaries

## Installation

```
dart pub add unique_name_generator
```
or 
```
flutter pub add unique_name_generator
```


## Usage

```dart
import 'package:unique_name_generator/unique_name_generator.dart';

void main() {
  var ung = UniqueNameGenerator(
    dictionaries: [adjectives, animals],
    style: NameStyle.capital,
    separator: '_',
  );

  List<String> names = List.generate(10, (index) => ung.generate());
  print(names);

  //Output: [Painful_Wren, Primary_Chicken, Swift_Wolf, Guilty_Rhinoceros, Silent_Panther, Still_Unicorn, Frail_Aphid, Willowy_Skink, Continued_Clownfish, Magnificent_Tyrannosaurus]
}
```
