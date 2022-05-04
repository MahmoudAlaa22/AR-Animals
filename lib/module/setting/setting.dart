import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/module/setting/widget/radio_list_tile_widget.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state_managment/setting_getx.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/SettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff508ced),
      body: GetBuilder<SettingGetx>(
          init: SettingGetx(),
          builder: (controller) {
            return ScreenModelWidget(
              image: Images.setting,
              text: LocaleKey.setting,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.language_sharp,color: Colors.white,),
                        title: Text(LocaleKey.language.tr.capitalizeFirst,
                        style: TextStyle(
                          fontSize: 25,fontWeight:FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius:BorderRadius.circular(25)
                        ),
                        child: Row(
                          children: [
                            RadioListTileWidget(
                              title: LocaleKey.arabic,
                              value: 1,
                              groupValue: controller.radioValue,
                            ),
                            RadioListTileWidget(
                              title: LocaleKey.english,
                              value: 2,
                              groupValue: controller.radioValue,
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.group,color: Colors.white,),
                        title: Text(LocaleKey.aboutUs.tr.capitalizeFirst,
                          style: TextStyle(
                              fontSize: 25,fontWeight:FontWeight.bold,
                              color: Colors.white
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius:BorderRadius.circular(25)
                        ),
                        child: Text('adasdasd asdasdasdasdsd',
                            style: TextStyle(
                                fontSize: 25,fontWeight:FontWeight.bold,
                                color: Colors.white
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
