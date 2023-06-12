import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:transactr/UI/flow%202/login.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: AnimatedSplashScreen(
              splash: Image.asset(
                "assets/images/splash/Transactr_Pty_Ltd.png",
              ),
              duration: 3000,
              animationDuration: const Duration(seconds: 1),
              nextScreen: const Login(),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.49,
            left: MediaQuery.of(context).size.width * 0.642,
            child: Image.asset(
              "assets/images/splash/Ellipse_top.png",
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.51,
            height: MediaQuery.of(context).size.height * 0.49,
            child: Image.asset(
              "assets/images/splash/Ellipse_bottom.png",
            ),
          ),
        ],
      ),
    );
  }
}
