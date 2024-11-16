import 'package:flutter/material.dart';

class RowIconText extends StatelessWidget {
  final double gap;
  final IconData icon;
  final String text;
  final double? fontSize;
  final Color iconColor;
  final Color textColor;
  final FontWeight? fontWeight;
  final bool centerAlign;
  const RowIconText({
    super.key,
    required this.gap,
    required this.icon,
    required this.text,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.centerAlign = false,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          centerAlign ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: gap,
        ),
        centerAlign ? getText() : Expanded(child: getText()),
      ],
    );
  }

  Text getText() {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          fontStyle: FontStyle.italic),
    );
  }
}
