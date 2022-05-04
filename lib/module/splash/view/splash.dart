import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/module/splash/state_management/splash_getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  static const routeName='/splash-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashGetx>(
          init: SplashGetx(),
            builder: (controller){
          return SvgPicture.asset(Images.bgSplash);
        }),
      ),
    );
  }
}
