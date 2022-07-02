import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/view/animal_screen.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeGetx controller = Get.put(HomeGetx());
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: AnimatedButtonWidget(
        onPressed: () {
          log("controller.itemSelected is ${controller.itemSelected}");
          if(controller.itemSelected <= (controller.coin/15-1)) {
            Get.toNamed(AnimalScreen.routeName);
          }
          else{
            Get.snackbar(LocaleKey.erorr.tr, LocaleKey.thisAnimalCannotBeUnlockedRightNow.tr,
            backgroundColor: Colors.red,
              colorText: Colors.white
            );
          }
            
        },
        color: Colors.orange,
        child: Container(
          key: controller.startButton,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(LocaleKey.start.tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
