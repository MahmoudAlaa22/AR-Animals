import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_getx.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/circle_scroll_view.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/items_of_animals.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/scan_button.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/shadow_in_home_view.dart';
import 'package:arcore_flutter_plugin_example/module/home/widget/start_button.dart';
import 'package:arcore_flutter_plugin_example/widgets/drawer_widget.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  static const routeName='/home-view';

  final  _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      backgroundColor: Color(0xff508ced),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.bottomCenter ,
          children: [
            ///To show shadow in home page
            ShadowInHomeView(),
            CircleScrollView(),
            StartButton(),
            ScanButton(),
            Positioned(
              top: 20,
              left:  Get.locale==Locale('en')?20:null,
              right:  Get.locale==Locale('en')?null:20,
              child: IconButton(onPressed: (){
                _scaffoldKey.currentState.openDrawer();
              }
              , icon: Icon(Icons.menu,color: Colors.white,
                  size: 40,
                  )),
            )
          ],
        ),
      ),
    );
  }

}
