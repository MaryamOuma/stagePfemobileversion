import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationController extends GetxController {
  final _box = GetStorage();
  RxString currentLanguage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Load the saved language from local storage on app startup
    loadLanguage();
  }

  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);

    // Save the selected language to local storage
    _box.write('language', '$languageCode-$countryCode');
    currentLanguage.value = '$languageCode-$countryCode';
  }

  void loadLanguage() {
    // Load the saved language from local storage
    var savedLanguage = _box.read('language');
    if (savedLanguage != null && savedLanguage is String) {
      currentLanguage.value = savedLanguage;
      var localeParts = savedLanguage.split('-');
      if (localeParts.length == 2) {
        Get.updateLocale(Locale(localeParts[0], localeParts[1]));
      }
    }
  }
}
