import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ShadowInHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: Get.height/1.7,),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(150),
          ),
          color: Colors.black12
      ),
    );
  }
}
