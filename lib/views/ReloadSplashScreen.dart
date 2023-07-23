import 'package:flutter/material.dart';

class ReloadSplashScreen extends StatefulWidget {
  const ReloadSplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ReloadSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add any initialization tasks you need here

    // Delay for a few seconds to show the animation
    Future.delayed(const Duration(seconds: 5), () {
      // Navigating to home screen or any other screen you want
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
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
