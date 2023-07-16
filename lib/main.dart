import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login/login.dart';
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
      home: LoginPage(),
      initialBinding: BindingsBuilder(() {
        Get.put(NotificationsController());
      }),
    );
  }
}
