
import 'dart:developer';

import 'package:arcore_flutter_plugin_example/module/home/view/home.dart';
import 'package:get/get.dart';

class SplashGetx extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    log('SplashGetx onInit');
    Future.delayed(Duration(seconds: 3),(){
      log('SplashGetx delayed');
      Get.toNamed(HomeView.routeName);
    });
    super.onInit();
  }
}