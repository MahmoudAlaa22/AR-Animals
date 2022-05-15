import 'package:arcore_flutter_plugin_example/model/animal_inf.dart';

class Animal {
  final String name;
  final String image;
  final String description;
  final String sound;
  final AnimalInf quiz;
  final int id;

  Animal({this.id,this.name, this.image, this.description, this.sound, this.quiz});
}