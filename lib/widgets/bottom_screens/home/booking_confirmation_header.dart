// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:seeyusoon/utils/assets.dart';
// import 'package:seeyusoon/utils/screen_size.dart';

// class BookingConfirmationHeader extends StatelessWidget {
//   final String status;
//   const BookingConfirmationHeader({Key? key, this.status = "Confirmed"})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           height: SizeConfig.screenHeight * 0.1,
//           width: SizeConfig.screenWidth * 0.3,
//           child: Lottie.asset(
//               status == "Confirmed" ? AppAssets.success : AppAssets.failed,
//               fit: BoxFit.contain,
//               reverse: true),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 status == "Confirmed" ? "Congratulations!" : "We're sorry!",
//                 style: TextStyle(
//                   color: status == "Confirmed" ? Colors.green : Colors.red,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Flexible(
//                 child: Text(
//                   "Your Booking is $status",
//                   style: TextStyle(
//                     color: status == "Confirmed" ? Colors.green : Colors.red,
//                     // overflow: TextOverflow.ellipsis,
//                   ),
//                   maxLines: 3,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//       ],
//     );
//   }
// }
