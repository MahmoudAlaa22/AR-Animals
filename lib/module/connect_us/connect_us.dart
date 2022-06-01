import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectUs extends StatelessWidget {
  static const routeName='/ConnectUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenModelWidget(
        image: Images.connectUs,
        text: LocaleKey.connectUs,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(LocaleKey.connectUs.tr.capitalize, style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),),
              Text(LocaleKey.forAnyInquiriesPleaseEmail.tr.capitalizeFirst, style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),),
              Text('devs@gmail.com',style: TextStyle(
                fontWeight:FontWeight.w900,
                  fontSize: 25,
                color: Colors.green
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
