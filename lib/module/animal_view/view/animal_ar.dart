import 'dart:developer';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/state_management/ar_gex.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/widget/bortder_setting_widget.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class AnimalAR extends StatefulWidget {
  const AnimalAR({Key key}) : super(key: key);
  static const routeName = '/animalAR';

  @override
  State<AnimalAR> createState() => _AnimalARState();
}

class _AnimalARState extends State<AnimalAR> {
  ArCoreController arCoreController;
String animalName='';
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeGetx>();
    final arGetx = Get.put(ArGetx());

    final int item = controller.itemSelected;
    setState(() {
      animalName=animalsItems[item].name.toLowerCase();
    });
    return Scaffold(
      body: RotatedBox(
        quarterTurns:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 0,
        child: Stack(
          children: [
            ArCoreView(
              onArCoreViewCreated: _onArCoreViewCreated,
              enableTapRecognizer: true,
            ),
            Positioned(
              right: 20,
              top: 0,
              child: Transform.rotate(
                angle: 1.55,
                child: Container(
                  // color: Colors.red,
                  height: 100,width: 100,
                  child: borderSetting(
                      onTap: (){
                        if(arGetx.player.playing){
                          arGetx.player.stop();
                        }
                        arGetx.player.setAsset(animalsItems[item].sound);
                        arGetx.player.play();
                      },
                      child: Icon(
                        Icons.music_note,
                        color: Color(0xff508ced),
                      ),
                      text: LocaleKey.sound.tr),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    log("_onArCoreViewCreated");
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;

  }

  void _addToucano(ArCoreHitTestResult plane) {
    log('vector.Vector3.random() is ${vector.Vector3.random()}');
    final toucanoNode = ArCoreReferenceNode(
        name: '$animalName.sfb',
        object3DFileName: '$animalName.sfb',
        position: plane.pose.translation,
        rotation: plane.pose.rotation,

    );

    arCoreController.addArCoreNodeWithAnchor(toucanoNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    log("ASDSADASDSA");
    _addToucano(hit);
  }

  void onTapHandler(String name) {
    print("Flutter: onNodeTap");
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: InkWell(
          onTap: (){
            arCoreController.removeNode(nodeName: name);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children: <Widget>[
              Text('Remove $name?'),
              Icon(
                Icons.delete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
