// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:seeyusoon/model/booking.dart';
// import 'package:seeyusoon/screens/bottom_screens/home/hotel_checkout_screen.dart';
// import 'package:seeyusoon/services/booking.service.dart';
// import 'package:seeyusoon/utils/datetime_extension.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/booking_card_content.dart';
// import 'package:seeyusoon/widgets/row_icon_text.dart';

// class BookingCard extends StatelessWidget {
//   final Booking booking;
//   const BookingCard({Key? key, required this.booking}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           BookingCardContent(booking: booking),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   booking.checkIn = DateTime.now().toISTzone();
//                   if (booking.isHourly) {
//                     booking.checkInTime = TimeOfDay.now().replacing(
//                         hour: (DateTime.now().toISTzone().hour + 1) % 24,
//                         minute: 0);
//                   } else {
//                     booking.checkOut =
//                         DateTime.now().toISTzone().add(const Duration(days: 7));
//                   }
//                   Navigator.of(context).push(MaterialPageRoute<dynamic>(
//                       builder: (BuildContext context) {
//                     return HotelCheckOutScreen(booking: booking);
//                   }));
//                 },
//                 child: const RowIconText(
//                     centerAlign: true,
//                     gap: 10,
//                     icon: Icons.replay,
//                     text: "Book again"),
//               ),
//               InkWell(
//                 onTap: () {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text("Clear booking"),
//                           content: const Text(
//                               "Are you sure you want to clear this booking?"),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text("No"),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Provider.of<BookingServices>(context,
//                                         listen: false)
//                                     .clearBooking(booking.bIDS)
//                                     .then((value) {
//                                   if (value) {
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(const SnackBar(
//                                       content: Text("Booking cleared"),
//                                     ));
//                                   } else {
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(const SnackBar(
//                                       content: Text("Error clearing booking"),
//                                     ));
//                                   }
//                                 });
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text("Yes"),
//                             ),
//                           ],
//                         );
//                       });
//                 },
//                 child: const RowIconText(
//                     centerAlign: true,
//                     gap: 10,
//                     icon: Icons.delete_outline,
//                     text: "Clear booking"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
