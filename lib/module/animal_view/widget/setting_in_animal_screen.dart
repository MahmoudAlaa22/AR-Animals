import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/animal_quaz/animal_quaz.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/state_management/ar_gex.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/view/animal_ar.dart';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bortder_setting_widget.dart';


class SettingInAnimalScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final HomeGetx controller = Get.put(HomeGetx());
    // final textStyle=Get.textTheme.bodyText2;
    final int item = controller.itemSelected;
    return GetBuilder<ArGetx>(
      init: ArGetx(),
      builder: (controller){
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            borderSetting(
                onTap: (){
                  if(controller.player.playing){
                    controller.player.stop();
                  }
                  controller.player.setAsset(animalsItems[item].sound);
                  controller.player.play();
                },
                child: Icon(
                  Icons.music_note,
                  color: Color(0xff508ced),
                ),
                text: LocaleKey.sound.tr),
            borderSetting(
              child: Icon(Icons.threed_rotation_sharp, color: Color(0xff508ced)), text: LocaleKey.AR.tr,
              onTap: ()=>Get.toNamed(AnimalAR.routeName),
            ),
            borderSetting(
              onTap: (){
                Get.toNamed(AnimalQuaz.routeName);
              },
                child: Icon(Icons.article, color: Color(0xff508ced)), text: LocaleKey.quize.tr),
          ],
        );
      },
    );

  }
}
