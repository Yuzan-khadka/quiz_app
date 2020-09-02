import 'package:flutter/material.dart';
import 'package:quiz_app/splash.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
