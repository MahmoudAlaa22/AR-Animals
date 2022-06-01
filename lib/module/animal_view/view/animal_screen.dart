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
    final controller = Get.find<HomeGetx>();
    final textStyle = Get.textTheme.bodyText2;
    final int item = controller.itemSelected;
    return Scaffold(
        backgroundColor: Color(0xff508ced),
        body: ScreenModelWidget(
          image: animalsItems[item].image,
          text: animalsItems[item].name,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SettingInAnimalScreen(),
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    animalsItems[item].description.tr,
                    textAlign: TextAlign.justify,
                    style: textStyle?.copyWith(color: Colors.white, fontSize: 25),
                  ),
                ),
              )),
            ],
          ),
        )
        );
  }
}
