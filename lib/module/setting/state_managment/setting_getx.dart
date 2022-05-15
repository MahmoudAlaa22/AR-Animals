import 'package:arcore_flutter_plugin_example/common/controller/shared_preferences/share_pref_kwy.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class SettingGetx extends GetxController{
  int radioValue = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    final local=sharedPreferences.getString(PrefKey.localization);
    changeRadioValue(local=='ar'?1:2);
    super.onInit();
  }
  void changeRadioValue(var v) {
    radioValue = v;
    update();
  }
}