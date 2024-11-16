import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BookingAmountRow extends StatelessWidget {
  final String title, amount;
  const BookingAmountRow(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              LineIcons.infoCircle,
              color: Colors.grey,
            ),
          ],
        ),
        Text(
          amount,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
