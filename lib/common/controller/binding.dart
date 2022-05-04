
import 'package:arcore_flutter_plugin_example/module/splash/state_management/splash_getx.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashGetx());
  }

}