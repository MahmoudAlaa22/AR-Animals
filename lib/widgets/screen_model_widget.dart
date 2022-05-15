import 'package:auto_size_text/auto_size_text.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(image!=null)...[
                Image.asset(
                  image,
                  height: Get.height * 0.5,
                ),
                ],
                AutoSizeText(
                  text.tr.capitalizeFirst,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  minFontSize: 30,
                  maxLines: 50,
                )
              ],
            ),
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
