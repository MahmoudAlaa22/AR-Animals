import 'package:arcore_flutter_plugin_example/module/home/view/scan_animal_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left:  Get.locale==Locale('en')?null:20,
      right:  Get.locale==Locale('en')?20:null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: (){
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
