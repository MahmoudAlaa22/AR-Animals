import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/items_of_animals.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleScrollView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeGetx>(
      init: HomeGetx(),
        builder: (controller){
          return CircleListScrollView(
            physics: CircleFixedExtentScrollPhysics(),
            axis: Axis.horizontal,
            itemExtent: Get.height*0.9,
            children: List.generate(animalsItems.length,itemsOfAnimals),
            radius: Get.width * 0.4,
            onSelectedItemChanged: (v){
              log("asf $v");
              controller.changeItemSelected(v);
              // Get.to(AnimalView());
            },
          );
    });

  }
}
