import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_getx.dart';
import 'package:arcore_flutter_plugin_example/module/setting/state_managment/setting_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioListTileWidget extends StatelessWidget {
  const RadioListTileWidget({
    this.title,
    this.value,
    this.groupValue,
  });

  final String title;
  final int value;
  final int groupValue;

  @override
  Widget build(BuildContext context) {
    final loginGetx = Get.find<SettingGetx>();
    final localeGetx = Get.put(LocaleGetx());

    return Flexible(
      child: RadioListTile(
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title.tr.capitalizeFirst,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          value: value,
          groupValue: groupValue,
          onChanged: (v) {
            loginGetx.changeRadioValue(v);
            if (v == 1) {
              localeGetx.changeLang("ar");
            } else {
              localeGetx.changeLang("en");
            }
          }),
    );
  }
}
