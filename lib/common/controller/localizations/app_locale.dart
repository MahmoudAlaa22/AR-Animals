import 'package:arcore_flutter_plugin_example/common/controller/localizations/arabic.dart';
import 'package:get/get.dart';

import 'english.dart';

class AppLocale extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":arabic,
    "en":english,
  };

}