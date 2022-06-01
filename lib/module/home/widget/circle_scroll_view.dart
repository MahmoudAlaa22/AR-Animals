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
    final homeGetx=Get.put(HomeGetx());
    return GetBuilder<HomeGetx>(
      init: HomeGetx(),
        initState: (v)async{
        await homeGetx.getIsTutorialCoachMark();
        if(homeGetx.isTutorialCoachMark!=true)
          homeGetx.showTutorial(context);
        },
        builder: (controller){
          return Stack(
            children: [
              Center(
                child: Container(
                  key: controller.categoryItemKey,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              CircleListScrollView(
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
              ),
            ],
          );
    });

  }
}
