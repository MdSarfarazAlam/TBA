import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  final Color iconColor;
  const IconTextButton(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onPressed,
      this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: onPressed,
          fillColor: Colors.grey.shade200,
          splashColor: Colors.green.shade100,
          padding: const EdgeInsets.all(16),
          shape: const CircleBorder(),
          elevation: 0,
          child: Icon(
            iconData,
            size: 24,
            color: iconColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ))
      ],
    );
  }
}
