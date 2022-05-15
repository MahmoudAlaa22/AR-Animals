import 'dart:developer';
import 'dart:math';

import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_answers.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_quazzes.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:arcore_flutter_plugin_example/widgets/setting_button_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state_management/animal_quaz_getx.dart';

class AnimalQuaz extends StatelessWidget {
  static const routeName = '/AnimalQuaz';

  @override
  Widget build(BuildContext context) {
    final homeGetx = Get.find<HomeGetx>();
    final int item = homeGetx.itemSelected;
    // final textStyle = Get.textTheme.bodyText2;

    return Scaffold(
      body:
      GetBuilder<AnimalQuazGetx>(
        init: AnimalQuazGetx(),
          builder: (controller){
            final list = listOfAnswers[controller.questionNumber] as List;
        return Stack(
          alignment:Alignment.center ,
          children: [
            ScreenModelWidget(
              image: animalsItems[item].image,
              text: listOfQuazzes[controller.questionNumber],
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65.0*4,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: list.length,
                            itemExtent: 65,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SettingButtonWidget(
                                  onTap: (){
                                    controller.changeItemSelected(index);
                                  },
                                  selected: index==controller.itemSelected,
                                  text: list[index],
                                  paddingVertical: 5,
                                  paddingHorizontal: 5,
                                  color: controller.changeColor(index)
                                  // index==controller.itemSelected?Colors.black54:Colors.black38
                                  ,
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20,top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(25) ,
                              boxShadow: [BoxShadow(blurRadius: 10,offset:Offset(0,3),
                                  color: Colors.black54)]
                          ),
                          child: SettingButtonWidget(
                            onTap: (){
                              controller.checkAnswer(animalSelected: item,
                                  answer:list[controller.itemSelected] );
                            },
                            width: 130,
                            paddingVertical: 2,
                            paddingHorizontal: 0,
                            text:   LocaleKey.check,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ConfettiWidget(
              confettiController: controller.controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
              true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: controller.drawStar, // define a custom shape/path.
            )
          ],
        );
      }),
    );
  }
}
