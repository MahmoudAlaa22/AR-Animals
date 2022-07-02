import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset(
              Images.star,
              height: 25,
            ),
            SizedBox(
              width: 10,
            ),
            GetBuilder<HomeGetx>(builder: (controller) {
              return Text(
                '${controller.coin-15}',
                style: TextStyle(color: Colors.white),
              );
            }),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
