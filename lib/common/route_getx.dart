import 'package:arcore_flutter_plugin_example/module/about_us/about_us.dart';
import 'package:arcore_flutter_plugin_example/module/animal_quaz/animal_quaz.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/view/animal_ar.dart';
import 'package:arcore_flutter_plugin_example/module/animal_view/view/animal_screen.dart';
import 'package:arcore_flutter_plugin_example/module/connect_us/connect_us.dart';
import 'package:arcore_flutter_plugin_example/module/home/view/home.dart';
import 'package:arcore_flutter_plugin_example/module/home/view/scan_animal_view.dart';
import 'package:arcore_flutter_plugin_example/module/login/login_screen.dart';
import 'package:arcore_flutter_plugin_example/module/setting/setting.dart';
import 'package:arcore_flutter_plugin_example/module/splash/view/splash.dart';
import 'package:get/get.dart';

class AppPages {

  static const initial = SplashView.routeName;

  static final routes = [
    GetPage(
      name: SplashView.routeName,
      page: ()=>SplashView()
    ),
    GetPage(
        name: HomeView.routeName,
        page: ()=>HomeView()
    ),
    GetPage(
        name: AnimalScreen.routeName,
        page: ()=>AnimalScreen()
    ),
    GetPage(
        name: AnimalAR.routeName,
        page: ()=>AnimalAR()
    ),
    GetPage(
        name: ScanAnimalView.routeName,
        page: ()=>ScanAnimalView()
    ),
    GetPage(
        name: SettingScreen.routeName,
        page: ()=>SettingScreen()
    ),
    GetPage(
        name: ConnectUs.routeName,
        page: ()=>ConnectUs()
    ),
    GetPage(
        name: AboutUs.routeName,
        page: ()=>AboutUs()
    ),
    GetPage(
        name: AnimalQuaz.routeName,
        page: ()=>AnimalQuaz()
    ),
    GetPage(
        name: LoginScreen.routeName,
        page: ()=>LoginScreen()
    ),
  ];
}