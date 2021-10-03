import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raslla_call/Initial%20Screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 50;

  @override
  void initState() {
    super.initState();
    updateSize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateSize() async {
    while (_height < 150) {
      await Future.delayed(
        Duration(milliseconds: 5),
      );
      setState(() {
        _height++;
      });
    }

    await Future.delayed(
      Duration(milliseconds: 500),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 0.75),
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage('logo.png'),
            height: _height,
          ),
        ),
      ),
    );
  }
}
