import 'package:flutter/material.dart';

import 'SplashScreen/Intro.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Calculator (BHARAT INTERN)",
      home: introSplash(),
    );
  }
}
