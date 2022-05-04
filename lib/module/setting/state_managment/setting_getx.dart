import 'package:get/get.dart';

class SettingGetx extends GetxController{
  int radioValue = 1;

  void changeRadioValue(var v) {
    radioValue = v;
    update();
  }
}