import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

import 'views/welcome_back_page.dart';
import 'views/login/Profile.dart';
import 'views/splash_screen.dart';
import 'controllers/PurchaseOrderController.dart';
import 'controllers/NotificationsController.dart';
import 'controllers/LocalizationController.dart';
import 'views/home.dart';
import 'locales/localization.dart';

void main() async {
  await GetStorage.init();
  // Load the selected language from GetStorage and set it to the controller
  LocalizationController localizationController = Get.put(LocalizationController());
  var savedLanguage = GetStorage().read<String>('language');
  if (savedLanguage != null && savedLanguage.isNotEmpty) {
  localizationController.currentLanguage.value = savedLanguage;
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register PurchaseOrderController
    Get.put(PurchaseOrderController());

    return FutureBuilder<bool>(
      future: getRememberMeStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool rememberMe = snapshot.data!;
          Widget initialRoute = rememberMe ? Home() : WelcomeBackPage();

          return GetMaterialApp(
            translations: Localization(), // Initialize the Localization class
            locale: Locale('en', 'US'), // Set the default locale for the app
            fallbackLocale: Locale('en', 'US'), // Set the fallback locale
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => initialRoute),
              GetPage(name: '/login', page: () => WelcomeBackPage()),
              GetPage(name: '/home', page: () => Home()),
              GetPage(name: '/Profile', page: () => Profile()),
            ],
            title: 'Stock Management',
            theme: ThemeData(
              brightness: Brightness.light,
              canvasColor: Colors.transparent,
              primarySwatch: Colors.blue,
              fontFamily: "Montserrat",
            ),
            home: SplashScreen(),
            initialBinding: BindingsBuilder(() {
              Get.put(NotificationsController());
              Get.put(PurchaseOrderController());
            }),
          );
        } else {
          // Show a loading indicator or splash screen while checking the status
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> getRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMeStatus = prefs.getBool('rememberMe') ?? false;
    return rememberMeStatus;
  }
}
