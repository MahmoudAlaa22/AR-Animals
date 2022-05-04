import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ScanAnimalView extends StatefulWidget {
  static const routeName = '/scan-animal-view';

  @override
  _ScanAnimalViewState createState() => _ScanAnimalViewState();
}

class _ScanAnimalViewState extends State<ScanAnimalView> {
  ArCoreController arCoreController;
  Map<String, ArCoreAugmentedImage> augmentedImagesMap = Map();
  Map<String, Uint8List> bytesMap = Map();
  double scale=1.0;
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatedBox(
        quarterTurns: MediaQuery
            .of(context)
            .orientation == Orientation.landscape ? 3 : 0 ,
        child: GestureDetector(
          // onScaleStart: ,
          onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails){
            setState(() {
              scale=scaleUpdateDetails.scale;
            });
          },
          child: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          type: ArCoreViewType.AUGMENTEDIMAGES,
      ),
        ),
    ),);
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    // arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onTrackingImage = _handleOnTrackingImage;
    loadMultipleImage();
  }
  loadMultipleImage() async {
    final ByteData bytes1 =
    await rootBundle.load(Images.cat);
    final ByteData bytes2 = await rootBundle.load(Images.dog);
    final ByteData bytes3 = await rootBundle.load(Images.bear);
    final ByteData bytes4 = await rootBundle.load(Images.tiger);
    final ByteData bytes5 = await rootBundle.load(Images.shark);
    final ByteData bytes6 = await rootBundle.load(Images.snake);
    bytesMap["cat"] = bytes1.buffer.asUint8List();
    bytesMap["dog"] = bytes2.buffer.asUint8List();
    bytesMap["bear"] = bytes3.buffer.asUint8List();
    bytesMap["tiger"] = bytes4.buffer.asUint8List();
    bytesMap["shark"] = bytes5.buffer.asUint8List();
    bytesMap["snake"] = bytes6.buffer.asUint8List();

    arCoreController.loadMultipleAugmentedImage(bytesMap: bytesMap);
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.name)) {
      augmentedImagesMap[augmentedImage.name] = augmentedImage;
      String animaleName='';
      switch (augmentedImage.name) {
        case "cat":
          setState(() {
            animaleName='cat';
          });
          break;
        case "dog":
          setState(() {
            animaleName='dog';
          });
          break;
        case "bear":
          setState(() {
            animaleName='bear';
          });
          break;
        case "tiger":
          setState(() {
            animaleName='tuger';
          });
          break;
        case "shark":
          setState(() {
            animaleName='shark';
          });
          break;
        case "snake":
          setState(() {
            animaleName='snake';
          });
          break;
      }
      log('scaleUpdateDetails is $scale');
      final toucanoNode = ArCoreReferenceNode(
        name: "$animaleName.sfb",
        object3DFileName: "$animaleName.sfb",
        position: augmentedImage.centerPose.translation,
        scale: vector.Vector3.all(0.5) ///Scale all -1 : 1 --> -0.1 smalle

        // rotation: augmentedImage.centerPose.rotation,
      );

      arCoreController.addArCoreNodeToAugmentedImage(toucanoNode,augmentedImage.index);
    }
  }
}
