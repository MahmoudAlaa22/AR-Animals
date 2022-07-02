import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  static const routeName='/AboutUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenModelWidget(
        showSound: false,
        image: Images.aboutUs,
        text: LocaleKey.aboutUs,
        child: SingleChildScrollView(
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
                    child: Text(LocaleKey.aboutUsDescription.tr,
                        style: TextStyle(
                            fontSize: 25,fontWeight:FontWeight.bold,
                            color: Colors.white
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
