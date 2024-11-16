import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String title;
  final Size? size;
  final Color? color;
  final Color? textColor;
  final FontWeight fontWeight;

  final double fontSize;
  final void Function()? onPressed;
  final double elevation;
  final double borderRadius;
  final Color? shadowColor;
  final BorderSide? borderSide;
  const MyButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size,
    this.color,
    this.textColor,
    this.borderRadius = 0,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 16,
    this.prefix,
    this.suffix,
    this.elevation = 0.0,
    this.shadowColor,
    this.borderSide,
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      // style: TextButton.styleFrom(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderSide ?? BorderSide.none),
          fixedSize: size ?? Size(MediaQuery.of(context).size.width, 56),
          elevation: elevation,
          shadowColor: shadowColor,
          backgroundColor: color),

      onPressed: onPressed,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefix ?? Container(),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: fontWeight,
              color: textColor,
              fontSize: fontSize,
            ),
          ),
          suffix ?? Container(),
        ],
      ),
    );
  }
}
