// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:seeyusoon/utils/colors.dart';
// import 'package:seeyusoon/utils/datetime_extension.dart';

// class CheckInCheckOutDate extends StatelessWidget {
//   final bool isRegular;
//   final DateTime checkIn;
//   final DateTime checkOut;
//   final int hours;
//   final int days;
//   final void Function(DateTime, DateTime) onDateChanged;
//   const CheckInCheckOutDate(
//       {Key? key,
//       required this.isRegular,
//       required this.checkIn,
//       required this.checkOut,
//       this.hours = 0,
//       this.days = 0,
//       required this.onDateChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         InkWell(
//           onTap: isRegular
//               ? () async {
//                   onDateChanged(
//                       (await showDatePicker(
//                               context: context,
//                               initialDate: checkIn,
//                               firstDate: DateTime.now().toISTzone(),
//                               lastDate: DateTime.now()
//                                   .toISTzone()
//                                   .add(const Duration(days: 365)))) ??
//                           checkIn,
//                       checkOut);
//                 }
//               : null,
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Text(
//                 'CHECK-IN',
//                 style: TextStyle(
//                   color: Colors.black38,
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     checkIn.day.toString(),
//                     style:
//                         const TextStyle(color: AppColors.accent, fontSize: 40),
//                   ),
//                   const SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         DateFormat("MMM").format(checkIn),
//                         style: const TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                       Text(
//                         DateFormat("EEE, hh:mm a").format(checkIn),
//                         style:
//                             const TextStyle(color: Colors.black, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 48,
//           width: 1,
//           color: Colors.grey,
//         ),
//         InkWell(
//           onTap: isRegular
//               ? () async {
//                   onDateChanged(
//                       checkIn,
//                       (await showDatePicker(
//                               context: context,
//                               initialDate: checkOut,
//                               firstDate: checkIn.add(const Duration(days: 1)),
//                               lastDate: DateTime.now()
//                                   .toISTzone()
//                                   .add(const Duration(days: 365)))) ??
//                           checkOut);
//                 }
//               : null,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Text(
//                 'CHECK-OUT',
//                 style: TextStyle(color: Colors.black38),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     checkOut.day.toString(),
//                     style:
//                         const TextStyle(color: AppColors.accent, fontSize: 40),
//                   ),
//                   const SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         DateFormat("MMM").format(checkOut),
//                         style: const TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                       Text(
//                         DateFormat("EEE, hh:mm a").format(checkOut
//                             .subtract(Duration(minutes: isRegular ? 30 : 0))),
//                         style:
//                             const TextStyle(color: Colors.black, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
