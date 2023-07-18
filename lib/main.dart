import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/login/login.dart';
import 'views/splash_screen.dart';
import 'controllers/PurchaseOrderController.dart';
import 'controllers/NotificationsController.dart';
import 'views/home.dart';

void main() {
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
          Widget initialRoute = rememberMe ? Home() : LoginPage();

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => initialRoute),
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/home', page: () => Home()),
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
