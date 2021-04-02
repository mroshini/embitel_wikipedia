import 'package:flutter/material.dart';
import 'package:wikipedia/core/utils/routes_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialSetup();
  }

  initialSetup() async {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, mainHome);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/images/wikipedia.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
