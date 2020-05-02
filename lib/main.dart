import 'package:ejemplo_internet/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
    )
  );
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
        () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InicioPage()
            ),
        );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Image.asset("assets/dispositivos.gif"),
      ),
    );
  }
}
