
import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class ArGetx extends GetxController{
  String selectedAnimal;
  AudioPlayer player=AudioPlayer();
  FlutterTts flutterTts = FlutterTts();

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
  Future<void> speak(String text)async{
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    // log('flutterTts.getLanguages is $l');
  }
}