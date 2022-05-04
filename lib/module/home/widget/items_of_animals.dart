import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget itemsOfAnimals(int i) {
  final HomeGetx controller=Get.put(HomeGetx());
  return Center(
    child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: controller.itemSelected==i?Colors.black38
        :Colors.transparent
        ,
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(animalsItems[i].image,
            height: Get.height*0.35,
            ),
            Text(animalsItems[i].name.tr,
            style: TextStyle(
              color: controller.itemSelected==i?Colors.white
                  :Colors.black,
              fontSize: 30,
              fontWeight:FontWeight.bold
            ),
            )
          ],
        ),
      ),
    ),
  );
}
