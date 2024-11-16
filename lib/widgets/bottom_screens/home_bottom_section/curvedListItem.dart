import 'package:flutter/material.dart';

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    super.key,
    required this.title,
    required this.time,
    // required this.icon,
    // required this.people,
    required this.color,
    required this.nextColor,
  });

  final String title;
  final String time;
  // final String people;
  // final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 25.0,
          bottom: 25,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              const Row(),
            ]),
      ),
    );
  }
}
