import 'dart:typed_data';

import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class MultipleAugmentedImagesPage extends StatefulWidget {
  @override
  _MultipleAugmentedImagesPageState createState() =>
      _MultipleAugmentedImagesPageState();
}

class _MultipleAugmentedImagesPageState
    extends State<MultipleAugmentedImagesPage> {
  ArCoreController arCoreController;
  Map<String, ArCoreAugmentedImage> augmentedImagesMap = Map();
  Map<String, Uint8List> bytesMap = Map();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multiple augmented images'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          type: ArCoreViewType.AUGMENTEDIMAGES,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
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
      final toucanoNode = ArCoreReferenceNode(
        name: "$animaleName.sfb",
        object3DFileName: "$animaleName.sfb",
        position: augmentedImage.centerPose.translation,
        // rotation: augmentedImage.centerPose.rotation,
      );

      arCoreController.addArCoreNodeToAugmentedImage(toucanoNode,augmentedImage.index);
    }
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {
    final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');

    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: augmentedImage.extentX / 2,
    );
    final node = ArCoreNode(
      shape: sphere,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }

  void _addCube(ArCoreAugmentedImage augmentedImage) {
    double size = augmentedImage.extentX / 2;
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(size, size, size),
    );
    final node = ArCoreNode(
      shape: cube,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }

  void _addCylindre(ArCoreAugmentedImage augmentedImage) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: augmentedImage.extentX / 2,
      height: augmentedImage.extentX / 3,
    );
    final node = ArCoreNode(
      shape: cylindre,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
