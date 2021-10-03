import 'package:flutter/services.dart';
import 'package:raslla_call/Initial%20Screens/home.dart';
import 'package:raslla_call/Initial%20Screens/splash_screen.dart';
import 'package:raslla_call/Initial%20Screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'Data/stateData.dart';

main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(new MyApp());
  StateData.loadState();
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
      routes: <String, WidgetBuilder>{
        'splash': (ctx) => SplashScreen(),
        'start': (ctx) => StartScreen(),
        'home': (ctx) => Home(),
      },
      initialRoute: 'start',
    );
  }
}
