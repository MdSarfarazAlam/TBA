import 'dart:math' as math;

import 'package:bta/utils/colors.dart';
import 'package:bta/widgets/auth/my_arc.dart';
import 'package:flutter/material.dart';

class RingScreen extends StatelessWidget {
  final List<Widget> children;
  final void Function()? backCallback;
  const RingScreen({super.key, required this.children, this.backCallback});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       // statusBarColor:    ColorCodeGen.colorFromHex('#342794').withOpacity(0.7),
    //       statusBarColor: Colors.transparent,
    //       statusBarIconBrightness: Brightness.light,
    //       statusBarBrightness: Brightness.light,
    //       systemNavigationBarIconBrightness: Brightness.dark,
    //       systemNavigationBarColor: App.themeNotifier.value == ThemeMode.light
    //           ? Colors.grey[50]
    //           : Colors.grey[850],
    //       systemNavigationBarDividerColor:
    //           App.themeNotifier.value == ThemeMode.light
    //               ? Colors.grey[50]
    //               : Colors.grey[850]),
    // );

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          MyArc(
            color: AppColors.primary,
            diameter: MediaQuery.of(context).size.width * 0.33,
            startAngle: math.pi * 1.5,
            sweepAngle: math.pi,
            center: Offset(0, MediaQuery.of(context).size.width * 0.12),
          ),
          MyArc(
            color: Colors.white,
            diameter: MediaQuery.of(context).size.width * 0.1,
            startAngle: math.pi * 1.5,
            sweepAngle: math.pi,
            center: Offset(0, MediaQuery.of(context).size.width * 0.12),
          ),
          MyArc(
            color: AppColors.primary,
            diameter: MediaQuery.of(context).size.width * 0.5,
            startAngle: 0.5 * math.pi,
            sweepAngle: math.pi / 2,
            center: Offset(MediaQuery.of(context).size.width, 0),
          ),
          MyArc(
            color: const Color.fromARGB(255, 211, 188, 157),
            diameter: MediaQuery.of(context).size.width * 0.5,
            startAngle: 2 * math.pi,
            sweepAngle: math.pi,
            center: Offset(MediaQuery.of(context).size.width * 0.25, 0),
          ),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Navigator.canPop(context)
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: const BackButton(
                                  color: Colors.black,
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: MediaQuery.of(context).size.width *
                              (Navigator.canPop(context) ? 0.1 : 0.2),
                        ),
                        ...children
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
