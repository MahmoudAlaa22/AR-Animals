import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectUs extends StatelessWidget {
  static const routeName='/ConnectUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenModelWidget(
        showSound: false,
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
              GestureDetector(
                onTap: ()async{
                  ///When I click on 3lmny@gmial.com it take me to email
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'devs.devs3010@gmail.com',
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                  await launchUrl(emailLaunchUri);
                  }
                },
                child: Text('devs.devs3010@gmail.com',style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight:FontWeight.w900,
                    fontSize: 25,
                  color: Colors.green
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
