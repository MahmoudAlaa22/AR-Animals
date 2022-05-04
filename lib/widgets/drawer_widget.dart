import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_getx.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/connect_us/connect_us.dart';
import 'package:arcore_flutter_plugin_example/module/setting/setting.dart';
import 'package:arcore_flutter_plugin_example/widgets/setting_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeGetx = Get.put(LocaleGetx());
    return Drawer(
      backgroundColor: Colors.black12,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            SettingButtonWidget(text: LocaleKey.setting,color: Colors.blue,
            onTap: (){
              Get.toNamed(SettingScreen.routeName);
            },),
            SettingButtonWidget(text: LocaleKey.connectUs,color: Colors.pinkAccent,
              onTap: (){
                Get.toNamed(ConnectUs.routeName);
              },),
            SettingButtonWidget(text: LocaleKey.quitApp,color: Colors.deepPurple,),
          ],
        ),
      ),
    );
  }
}
