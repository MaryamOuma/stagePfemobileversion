import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login/login.dart';
import 'views/splash_screen.dart';
import 'controllers/PurchaseOrderController.dart';
import 'controllers/NotificationsController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register PurchaseOrderController
    Get.put(PurchaseOrderController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Set to false to remove the debug banner
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
      }),
    );
  }
}
