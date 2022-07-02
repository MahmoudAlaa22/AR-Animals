import 'dart:math';

import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/assets/sounds.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_answers.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/common/theme/text_style.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AnimalQuazGetx extends GetxController {
  int itemSelected;
  int questionNumber = 0;
  AudioPlayer player = AudioPlayer();
  bool answerIsRight = false;
  bool addCoins = false;
  ConfettiController controllerCenter;
  List answerList = [];

  @override
  void onInit() {
    getAnswerList();
    controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
    super.onInit();
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    super.dispose();
  }

  void getAnswerList() {
    answerList = getRandomElement(listOfAnswers[questionNumber]);
    update();
  }

  List getRandomElement<T>(List<T> list) {
    List l = [];
    final random = Random();
    var i = 1;
    while (i == 1) {
      var element = random.nextInt(list.length);
      if (!l.contains(list[element])) {
        l.add(list[element]);
        if (l.length == list.length) {
          break;
        }
      }
    }
    return l;
  }

  void changeItemSelected(int index) {
    itemSelected = index;
    playAudio(Sounds.selectItem);
    update();
  }

  void changeQuestionNumber(int index) {
    answerIsRight = false;
    questionNumber = index;
    update();
  }

  void checkAnswer({int animalSelected, String answer}) async {
    if (questionNumber == 0) {
      if (answer == animalsItems[animalSelected].name) {
        answerRight(questionNumber);
      } else {
        answerWrong();
      }
    } else if (questionNumber == 1) {
      if (answer == animalsItems[animalSelected].quiz.femaleName) {
        answerRight(questionNumber);
      } else {
        answerWrong();
      }
    } else if (questionNumber == 2) {
      if (answer == animalsItems[animalSelected].quiz.babyAnimal) {
        answerRight(questionNumber);
      } else {
        answerWrong();
      }
    } else if (questionNumber == 3) {
      if (answer == animalsItems[animalSelected].quiz.feedOn) {
        answerRight(questionNumber);
      } else {
        answerWrong();
      }
    } else {
      if (answer == animalsItems[animalSelected].quiz.nameOfSound) {
        playAudio(Sounds.finishingQuiz);
        answerIsRight = true;
        controllerCenter.play();
        final homeGetx = Get.find<HomeGetx>();
        if (!addCoins) homeGetx.changeCionValue(value: 15);
        addCoins = true;
        update();
        Get.snackbar(LocaleKey.wellDone.tr,
            LocaleKey.youHaveSuccessfullyCompletedAllTheQuestions.tr,
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.defaultDialog(
            title: '${LocaleKey.congratulations.tr} 🎉',
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.star,
                  height: 60,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('${homeGetx.coin-15}',
                    style: AppTextStyle.robotoTextStyle
                        .copyWith(fontWeight: FontWeight.bold,
                      fontSize: 30
                    )),
              ],
            ),
            actions: [
              AnimatedButtonWidget(
                color: Colors.green,
                onPressed: () {Get.back();},
                child: Text(
                  LocaleKey.wellDone.tr.capitalize,
                  style: AppTextStyle.robotoTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ]);
      } else {
        answerWrong();
      }
    }
  }

  Future<void> answerRight(int num) async {
    playAudio(Sounds.passQuestion);
    answerIsRight = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    itemSelected = null;
    changeQuestionNumber(num + 1);
    getAnswerList();
  }

  void answerWrong() {
    answerIsRight = false;
    update();
    playAudio(Sounds.failingInQuestion);
    Get.snackbar(LocaleKey.theAnswerIsWrong.tr, LocaleKey.tryAgain.tr,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  void playAudio(String sound) {
    player.setAsset(sound);
    player.play();
  }

  Color changeColor(int index) {
    //when I selected item.
    if (index == itemSelected) {
      if (!answerIsRight) {
        return Colors.black54;
      } else {
        return Colors.green;
      }
    }
    //when item not selected.
    else {
      return Colors.black38;
    }
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
