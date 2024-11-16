// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/booking.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/booking_checkin_checkout_date.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/booking_details_row.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/dotted_line.dart';

// class BookingDetailsBasic extends StatelessWidget {
//   final Booking booking;
//   const BookingDetailsBasic({Key? key, required this.booking})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BookingCheckInCheckOutDate(
//             checkIn: booking.checkIn,
//             checkOut: booking.checkOut ??
//                 booking.checkIn.add(Duration(
//                     hours: booking.isHourly ? booking.hours : 0,
//                     days: booking.isHourly ? 0 : booking.days)),
//             hours: booking.hours,
//             days: booking.days,
//             isHourly: booking.isHourly),
//       ),
//       const DottedLine(),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BookingDetailsRow(title: 'Booking ID', value: booking.bIDS),
//       ),
//       const DottedLine(),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BookingDetailsRow(
//           title: 'Reserved for',
//           value: '${booking.customer!.fullname}\n${booking.customer!.phone}',
//         ),
//       ),
//       const DottedLine(),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BookingDetailsRow(
//           title: 'Rooms & Guests',
//           value:
//               '${booking.rooms} Classics,  ${booking.adults + booking.children} Guests',
//         ),
//       ),
//     ]);
//   }
// }
