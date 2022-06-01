import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:arcore_flutter_plugin_example/module/home/view/scan_animal_view.dart';
import 'package:arcore_flutter_plugin_example/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final homeGetx=Get.put(HomeGetx());
    return Positioned(
      key: homeGetx.scanAnimalKey,
      top: 20,
      left:  Get.locale==Locale('en')?null:20,
      right:  Get.locale==Locale('en')?20:null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: AnimatedButtonWidget(
          width: 50,
          color: Colors.transparent,
          onPressed: (){
            Get.toNamed(ScanAnimalView.routeName);
          },
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 5,offset:Offset(2,3) )]
              ),
              child: Icon(Icons.qr_code_scanner_sharp,
                color: Colors.blueAccent,
                size: 30,
              )),
        ),
      ),
    );
  }
}
