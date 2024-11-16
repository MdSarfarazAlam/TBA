import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BookingDetailsRow extends StatelessWidget {
  final String title, value;
  const BookingDetailsRow(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          LineIcons.arrowRight,
          color: Colors.black,
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 2,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
