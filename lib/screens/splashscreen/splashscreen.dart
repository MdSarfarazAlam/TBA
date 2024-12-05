import 'dart:async';
import 'package:bta/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/size_config.dart';
// import 'package:trip69/flightUI.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool _large = true;
  double _width = 100;
  double _height = 100;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    print("Another Screen");

    if (_large == true) {
      Timer(const Duration(seconds: 2), () {
        setState(() {
          // Generate a random width and height.
          _width = SizeConfig.blockSizeHorizontal! * 60;
          _height = SizeConfig.blockSizeVertical! * 30;
          _large = false;
        });
      });
    } else {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: HomeScreen()),
              (route) => false));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'assets/splashScreen.jpeg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.amber.withOpacity(0.3),
                BlendMode.hardLight,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            child: Image.asset(
              'assets/logo-removebg.png',
            ),
          ),
        ),
      ]),
    );
  }
}
