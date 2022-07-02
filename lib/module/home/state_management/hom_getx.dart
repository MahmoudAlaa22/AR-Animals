import 'dart:developer';

import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/common/controller/shared_preferences/share_pref_kwy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../main.dart';

class HomeGetx extends GetxController {
  int itemSelected = 0;
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];
  GlobalKey categoryItemKey = GlobalKey();
  GlobalKey scanAnimalKey = GlobalKey();
  GlobalKey startButton = GlobalKey();
  bool isTutorialCoachMark;
  int coin=15;

  void changeCionValue({@required int value}){
    coin+=value;
    update();
  }
Future<void> getIsTutorialCoachMark()async{
  isTutorialCoachMark= sharedPreferences.getBool(PrefKey.tutorialCoachMark);
  update();
}

  void changeItemSelected(int item) {
    itemSelected = item;
    log("changeItemSelected itemSelected is $itemSelected");
    update();
  }

  void showTutorial(BuildContext context) {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.deepPurple,
      textSkip: LocaleKey.skip.tr,
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        sharedPreferences.setBool(PrefKey.tutorialCoachMark, true);
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
        sharedPreferences.setBool(PrefKey.tutorialCoachMark, true);
      },
    )..show();
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "categoryItemKey",
        keyTarget: categoryItemKey,
        alignSkip: Alignment.bottomRight,
        color: Colors.black45,
        contents: [
          TargetContent(
            // align: ContentAlign.left,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      LocaleKey.categoryItem.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "scanAnimalKey",
        keyTarget: scanAnimalKey,
        alignSkip: Alignment.bottomRight,
        contents: [
          TargetContent(
            // align: ContentAlign.left,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      LocaleKey.scanAnimal.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "startButton",
        keyTarget: startButton,
        alignSkip: Alignment.bottomRight,
        color: Colors.orange,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      LocaleKey.startDescription.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    update();
  }
}
