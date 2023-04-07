import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo App",
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: const Icon(
            Icons.list_alt,
            color: Colors.amber,
            size: 100.0,
          ),
          nextScreen: const Home(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.deepPurple,
          splashIconSize: 100.0,
      )
    );
  }
}


