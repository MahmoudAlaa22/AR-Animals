import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleGetx extends GetxController{
  void changeLang(String codeLang){
    Get.updateLocale(Locale(codeLang));
  }
}