import 'dart:developer';
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/state_management/hom_getx.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:get/get.dart';


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
    final HomeGetx controller = Get.put(HomeGetx());
    final int item = controller.itemSelected;
    setState(() {
      animalName=animalsItems[item].name.toLowerCase();
    });
    return Scaffold(
      body: RotatedBox(
        quarterTurns:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 0,
        child: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
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
    final toucanoNode = ArCoreReferenceNode(
        name: '$animalName.sfb',
        object3DFileName: '$animalName.sfb',
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

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
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  arCoreController.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
