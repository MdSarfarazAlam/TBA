import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  final double diameter;
  final Color? color;
  final double startAngle;
  final double sweepAngle;
  final Offset center;

  const MyArc(
      {super.key,
      required this.diameter,
      this.color = Colors.purple,
      this.startAngle = 0,
      this.sweepAngle = math.pi * 2,
      this.center = Offset.zero});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(
          color: color!,
          startAngle: startAngle,
          sweepAngle: sweepAngle,
          center: center),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double sweepAngle;
  final Offset center;
  MyPainter(
      {required this.color,
      required this.startAngle,
      required this.sweepAngle,
      required this.center});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        // center: Offset(center.dx + size.width / 2, center.dy + size.height / 2),
        height: size.height,
        width: size.width,
      ),
      startAngle,
      sweepAngle,
      true, // arc, chord
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
