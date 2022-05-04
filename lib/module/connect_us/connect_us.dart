import 'package:arcore_flutter_plugin_example/common/assets/images.dart';
import 'package:arcore_flutter_plugin_example/common/controller/localizations/locale_key.dart';
import 'package:arcore_flutter_plugin_example/widgets/screen_model_widget.dart';
import 'package:flutter/material.dart';

class ConnectUs extends StatelessWidget {
  static const routeName='/ConnectUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenModelWidget(
        image: Images.connectUs,
        text: LocaleKey.connectUs,
        child: Container(),
      ),
    );
  }
}
