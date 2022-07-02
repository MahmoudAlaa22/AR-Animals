import 'dart:developer';

import 'package:arcore_flutter_plugin_example/module/animal_view/state_management/ar_gex.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenModelWidget extends StatelessWidget {
  const ScreenModelWidget({this.image, this.text, this.child, this.showSound=true});

  final String image;
  final String text;
  final Widget child;
  final bool showSound;

  @override
  Widget build(BuildContext context) {
    final arGetx=Get.put(ArGetx());
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
                if (image != null) ...[
                  Image.asset(
                    image,
                    height: Get.height * 0.5,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        text.tr.capitalizeFirst,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        minFontSize: 30,
                        maxLines: 50,
                      ),
                    ),
                    if (Get.locale.toString() == 'en'&&showSound)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                            onPressed: () {
                              arGetx.speak(text.tr);
                            },
                            icon: Icon(
                              Icons.volume_up_sharp,
                              color: Colors.white,
                            )),
                      )
                  ],
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
