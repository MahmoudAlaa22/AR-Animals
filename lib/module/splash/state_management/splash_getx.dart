
import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/shared_preferences/share_pref_kwy.dart';
import 'package:arcore_flutter_plugin_example/main.dart';
import 'package:arcore_flutter_plugin_example/module/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashGetx extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    final locale=sharedPreferences.getString(PrefKey.localization);
    Get.updateLocale(Locale(locale??'en'));
    Future.delayed(Duration(seconds: 3),(){
      Get.toNamed(HomeView.routeName);
    });
    super.onInit();
  }
}