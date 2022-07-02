import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget itemsOfAnimals(int i) {
  final HomeGetx controller = Get.find<HomeGetx>();
  return Center(
    child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        border: (i <= (controller.coin/15-1)) ? null : Border.all(width: 5, color: Colors.black),
        shape: BoxShape.circle,
        color:
            controller.itemSelected == i ? Colors.black38 : Colors.transparent,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  animalsItems[i].image,
                  height: Get.height * 0.35,
                ),
                Text(
                  animalsItems[i].name.tr,
                  style: TextStyle(
                      color: controller.itemSelected == i
                          ? Colors.white
                          : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          if(i > (controller.coin/15-1))
          Positioned(
            left: 10,
            bottom: 20,
            child: Image.asset(
              Images.lock,
              height: 30,
            ),
          )
        ],
      ),
    ),
  );
}
