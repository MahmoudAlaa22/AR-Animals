import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/assets/sounds.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/model/animal.dart';
import 'package:arcore_flutter_plugin_example/model/animal_inf.dart';

final List<Animal> animalsItems = [
  Animal(
      id: 1,
      name: LocaleKey.cat,
      image: Images.cat,
      description:
      LocaleKey.catDescription,
      sound: Sounds.cat,
      quiz: AnimalInf(
        femaleName: LocaleKey.femaleCat,
        babyAnimal: LocaleKey.babyCat,
        feedOn: LocaleKey.feedOnCat,
        nameOfSound: LocaleKey.nameOfSoundCat,
      )
  ),
  Animal(
      id: 2,
      name: LocaleKey.dog,
      image: Images.dog,
      description:
      LocaleKey.dogDescription,
      sound: Sounds.dog,
      quiz: AnimalInf(
        femaleName: LocaleKey.femaleDog,
        babyAnimal: LocaleKey.babyDog,
        feedOn: LocaleKey.feedOnDog,
        nameOfSound: LocaleKey.nameOfSoundDog,
      )
  ),
  Animal(
      id: 3,
      name: LocaleKey.bear,
      image: Images.bear,
      description:
      LocaleKey.bearDescription,
      sound: Sounds.bear,
      quiz: AnimalInf(
        femaleName: LocaleKey.femaleBear,
        babyAnimal: LocaleKey.babyBear,
        feedOn: LocaleKey.feedOnBear,
        nameOfSound: LocaleKey.nameOfSoundBear,
      )
  ),
  Animal(
    id: 4,
    name: LocaleKey.tiger,
    image: Images.tiger,
    description:
    LocaleKey.tigerDescription,
    sound: Sounds.tiger,
    quiz: AnimalInf(
      femaleName: LocaleKey.femaleTiger,
      babyAnimal: LocaleKey.babyTiger,
      feedOn: LocaleKey.feedOnTiger,
      nameOfSound: LocaleKey.nameOfSoundTiger,
    ),
  ),
  Animal(
      id: 5,
      name: LocaleKey.shark,
      image: Images.shark,
      description:
      LocaleKey.sharkDescription,
      quiz: AnimalInf(
        femaleName: LocaleKey.femaleShark,
        babyAnimal: LocaleKey.babyShark,
        feedOn: LocaleKey.feedOnShark,
        nameOfSound: LocaleKey.nameOfSoundShark,
      )
  ),
  Animal(
      id: 6,
      name: LocaleKey.snake,
      image: Images.snake,
      description: LocaleKey.snakeDescription,
      sound: Sounds.snake,
      quiz: AnimalInf(
        femaleName: LocaleKey.femaleSnake,
        babyAnimal: LocaleKey.babySnake,
        feedOn: LocaleKey.feedOnSnake,
        nameOfSound: LocaleKey.nameOfSoundSnake,
      )
  ),
];
