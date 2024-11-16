// import 'package:flutter/material.dart';


// class BookingCheckInCheckOutDate extends StatelessWidget {
//   final DateTime checkIn, checkOut;
//   final bool isHourly;
//   final int hours, days;
//   const BookingCheckInCheckOutDate(
//       {Key? key,
//       required this.checkIn,
//       required this.checkOut,
//       required this.isHourly,
//       required this.hours,
//       required this.days})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Check-in',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               Text(DateFormat('EEE, dd MMMM').format(checkIn.toISTzone())),
//               Text(
//                   "${DateFormat('hh:mm a').format(checkIn.toISTzone())} Onwards"),
//             ],
//           ),
//         ),
//         Text(
//           isHourly ? "$hours Hrs" : "$days N",
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 'Check-out',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               Text(DateFormat('EEE, dd MMMM').format(checkOut.toISTzone())),
//               Text(
//                   "Before ${DateFormat('hh:mm a').format(checkOut.toISTzone().subtract(Duration(minutes: isHourly ? 0 : 30)))}")
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
