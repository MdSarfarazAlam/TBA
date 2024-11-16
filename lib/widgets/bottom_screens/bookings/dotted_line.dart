// import 'package:flutter/material.dart';
// import 'package:seeyusoon/utils/screen_size.dart';

// class DottedLine extends StatelessWidget {
//   const DottedLine({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final boxWidth = constraints.constrainWidth();
//         const dashWidth = 2.0;
//         final dashHeight = SizeConfig.screenHeight * 0.001;
//         final dashCount = (boxWidth / (2 * dashWidth)).floor();
//         return Flex(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           direction: Axis.horizontal,
//           children: List.generate(dashCount, (_) {
//             return SizedBox(
//               width: dashWidth,
//               height: dashHeight,
//               child: const DecoratedBox(
//                 decoration: BoxDecoration(color: Colors.grey),
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }
