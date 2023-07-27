import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:get/get.dart';

class ReloadSplashScreen extends StatefulWidget {
  final bool rememberMe;

  const ReloadSplashScreen({Key? key, required this.rememberMe})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ReloadSplashScreen> {
  final NotificationController notifController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();

    // Add any initialization tasks you need here
    // Load the saved data when the app starts
    // notifController.loadData();
    // Delay for a few seconds to show the animation
    Future.delayed(const Duration(seconds: 5), () {
      // Navigating to home screen or any other screen you want
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the app is being resumed (coming back from the background)

    // Delay navigation to the home page if rememberMe is true
    /*  if (isResumed) {
      // Redirect based on rememberMe when the app is resumed
      if (!widget.rememberMe) {
        Get.offNamed('/login');
      } else {
        Get.offNamed('/login');
      }
    }*/
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'animations/reload-animation.gif',
          width: 200, // Set the width of the image as per your requirements
          height: 200, // Set the height of the image as per your requirements
        ),
      ),
    );
  }
}
