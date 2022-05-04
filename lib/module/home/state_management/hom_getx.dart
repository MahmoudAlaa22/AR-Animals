import 'dart:developer';

import 'package:get/get.dart';

class HomeGetx extends GetxController{
  int itemSelected=0;

  void changeItemSelected(int item){
    itemSelected=item;
    log("changeItemSelected itemSelected is $itemSelected");
    update();
  }
}