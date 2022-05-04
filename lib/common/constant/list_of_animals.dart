import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/assets/sounds.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/model/animal.dart';

final List<Animal> animalsItems = [
  Animal(
    name: LocaleKey.cat,
    image: Images.cat,
    description:
    LocaleKey.catDescription,
    sound: Sounds.cat
  ),
  Animal(
    name: LocaleKey.dog,
    image: Images.dog,
    description:
    LocaleKey.dogDescription,
    sound: Sounds.dog
  ),
  Animal(
    name: LocaleKey.bear,
    image: Images.bear,
    description:
    LocaleKey.bearDescription,
    sound: Sounds.bear
  ),
  Animal(
    name: LocaleKey.tiger,
    image: Images.tiger,
    description:
    LocaleKey.tigerDescription,
    sound: Sounds.tiger
  ),
  Animal(
    name: LocaleKey.shark,
    image: Images.shark,
    description:
    LocaleKey.sharkDescription,
  ),
  Animal(
    name: LocaleKey.snake,
    image: Images.snake,
    description: LocaleKey.snakeDescription,
    sound: Sounds.snake
  ),
];
