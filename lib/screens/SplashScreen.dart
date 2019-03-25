import 'package:flutter/material.dart';
import 'package:sawken/Utilities/AppColors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.black,
      body: new Center (
        child: new Image.asset('images/splashScreen.png'),
        ),
    );
  }
}