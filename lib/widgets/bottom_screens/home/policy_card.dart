// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:seeyusoon/utils/colors.dart';

// class PolicyCard extends StatelessWidget {
//   final String policy;
//   final String title;
//   final bool flat;
//   const PolicyCard(
//       {Key? key, required this.title, required this.policy, this.flat = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.zero,
//       shape: !flat
//           ? const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(25.0),
//               ),
//             )
//           : null,
//       elevation: !flat ? 2.0 : 0.0,
//       child: Container(
//         padding: EdgeInsets.all(!flat ? 8.0 : 0.0),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: !flat ? 16.0 : 0.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               Text(title,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: flat ? 16 : 18,
//                       color: !flat ? AppColors.primary : Colors.black)),
//               const SizedBox(height: 8),
//               Html(
//                 data: policy,
//                 style: {
//                   "strong": Style(
//                     fontSize: FontSize(14.0),
//                     color: AppColors.primary,
//                   ),
//                 },
//               ),
//               // Text(
//               //   policy,
//               //   style: const TextStyle(
//               //     color: Colors.black45,
//               //     fontSize: 12,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
