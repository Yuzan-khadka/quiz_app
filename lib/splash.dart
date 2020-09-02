import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      body: Center(
        child: Text('QuizApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: 'Satisfy'
            )),
      ),
    );
  }
}
