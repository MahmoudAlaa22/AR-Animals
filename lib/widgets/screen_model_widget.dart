import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenModelWidget extends StatelessWidget {
  const ScreenModelWidget({this.image, this.text, this.child});

  final String image;
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints.expand(width: Get.width / 3),
          color: Colors.black38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                height: Get.height * 0.5,
              ),
              Text(
                text.tr.capitalizeFirst,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: child,
          ),
        )
      ],
    );
  }
}
