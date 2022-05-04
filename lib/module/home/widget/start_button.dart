import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/view/animal_screen.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class StartButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeGetx controller=Get.put(HomeGetx());
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: (){
          log("controller.itemSelected is ${controller.itemSelected}");
          Get.toNamed(AnimalScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(LocaleKey.start.tr,
            style: TextStyle(
                color:Colors.white,
                fontSize: 30,fontWeight:FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
