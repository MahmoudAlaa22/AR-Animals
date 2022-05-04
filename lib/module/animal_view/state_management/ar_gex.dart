
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class ArGetx extends GetxController{
  String selectedAnimal;
  AudioPlayer player=AudioPlayer();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    player.stop();
    super.onClose();
  }

  void changeSelectedAnimal(String animal){
    selectedAnimal=animal;
    update();
  }
}