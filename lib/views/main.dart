import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/localization_controller.dart';
import 'package:flutter_project/views/ReloadSplashScreen.dart';
import 'package:flutter_project/views/WelcomeBack.dart';
import 'package:flutter_project/views/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'locals/localization.dart';

void main() async {
  await GetStorage.init();
  // Load the selected language from GetStorage and set it to the controller
  LocalizationController localizationController =
      Get.put(LocalizationController());
  var savedLanguage = GetStorage().read<String>('language');
  if (savedLanguage != null && savedLanguage.isNotEmpty) {
    localizationController.currentLanguage.value = savedLanguage;
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String? authToken;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    /* WidgetsBinding.instance?.addObserver(this);
    _initializeAppData();*/
  }

  /* @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Trigger the initialization tasks when the app is resumed
      _initializeAppData();
    }
    super.didChangeAppLifecycleState(state);
  }*/

  @override
  Widget build(BuildContext context) {
    Widget initialRoute = WelcomeBackPage();

    return GetMaterialApp(
      // Save the data when the app closes
      translations: Localization(), // Initialize the Localization class
      locale: Locale('en', 'US'), // Set the default locale for the app
      fallbackLocale: Locale('en', 'US'), // Set the fallback locale
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => initialRoute),
        GetPage(name: '/home', page: () => Home()),
        // Define your other routes here...
      ],
    );
  }

  Future<void> _initializeAppData() async {
    authToken = GetStorage().read<String>('authToken');
    rememberMe = GetStorage().read<bool>('rememberMe') ?? false;
    //setState(() {}); // Trigger a rebuild to reflect the changes
  }
}
