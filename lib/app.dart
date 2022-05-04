import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'common/controller/binding.dart';
import 'common/route_getx.dart';
import 'common/theme/theme.dart';
import 'module/splash/view/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      // DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    log("Get locale ${Get.locale}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      theme: themeData,
      // home: HomeScreen(),
      // initialRoute: AppPages.initial,
      initialBinding: MyBinding(),
      locale: Get.deviceLocale,
      translations: AppLocale(),
      getPages: AppPages.routes,
    );
  }
}
