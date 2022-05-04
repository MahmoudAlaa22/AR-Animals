import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/widget/setting_in_animal_screen.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalScreen extends StatelessWidget {
  static const routeName = '/animal-view';

  @override
  Widget build(BuildContext context) {
    final HomeGetx controller = Get.put(HomeGetx());
    final textStyle = Get.textTheme.bodyText2;
    final int item = controller.itemSelected;
    log("Get locale in animal screen ${Get.locale}");
    log('animalsItems[item].name.tr is ${LocaleKey.bearDescription.tr}');
    return Scaffold(
        backgroundColor: Color(0xff508ced),
        body: ScreenModelWidget(
          image: animalsItems[item].image,
          text: animalsItems[item].name,
          child: Column(
            children: [
              SettingInAnimalScreen(),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  animalsItems[item].description.tr,
                  textAlign: TextAlign.justify,
                  style: textStyle?.copyWith(color: Colors.white, fontSize: 25),
                ),
              ))
            ],
          ),
        )
        // Row(
        //   children: [
        //     Container(
        //       constraints: BoxConstraints.expand(width: Get.width / 3),
        //       color: Colors.black38,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Image.asset(
        //             animalsItems[item].image,
        //             height: Get.height * 0.5,
        //           ),
        //           Text(
        //             animalsItems[item].name.tr,
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 50,
        //                 fontWeight: FontWeight.bold),
        //           )
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         child: Column(
        //           children: [
        //             SettingInAnimalScreen(),
        //             Expanded(child: SingleChildScrollView(
        //               padding: EdgeInsets.symmetric(horizontal: 10),
        //               child: Text(animalsItems[item].description.tr,
        //               textAlign:TextAlign.justify,
        //               style: textStyle?.copyWith(
        //                 color: Colors.white,
        //                 fontSize: 25
        //               ),
        //               ),
        //             ))
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
