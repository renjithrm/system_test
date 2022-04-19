import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Center(
          child: Lottie.asset("assets/100965-add-user-profile.json"),
        ),
      ),
    );
  }
}

class Spalsh {
  Spalsh._();
  static final instance = Spalsh._();
  Future spalsh() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
