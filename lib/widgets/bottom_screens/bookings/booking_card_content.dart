// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:seeyusoon/model/booking.dart';
// import 'package:seeyusoon/utils/datetime_extension.dart';
// import 'package:seeyusoon/utils/string_extension.dart';
// import 'package:seeyusoon/utils/strings.dart';

// class BookingCardContent extends StatelessWidget {
//   final Booking booking;
//   const BookingCardContent({Key? key, required this.booking}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Stack(
//           children: [
//             SizedBox(
//               height: 90,
//               width: 120,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(4.0),
//                   child: CachedNetworkImage(
//                     imageUrl: booking.hotel!.gallery.first,
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             Positioned(
//               top: 2,
//               left: 2,
//               child: Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 4.0, vertical: 2.0),
//                   decoration: BoxDecoration(
//                       color: booking.bookingStatus == "Confirmed"
//                           ? Colors.green
//                           : Colors.red,
//                       borderRadius: BorderRadius.circular(4.0)),
//                   child: Text(booking.bookingStatus,
//                       style:
//                           const TextStyle(color: Colors.white, fontSize: 10))),
//             )
//           ],
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 booking.hotel!.name.toTitleCase(),
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               booking.isHourly
//                   ? Text(
//                       "${DateFormat("MMMM d, EEE h:m a").format(booking.checkIn.toISTzone())} to ${DateFormat('h:m a').format(booking.checkOut != null ? booking.checkOut!.toISTzone() : booking.checkIn.add(Duration(hours: booking.hours)))}",
//                     )
//                   : Text(
//                       "${DateFormat(AppStrings.dateFormat).format(booking.checkIn.toISTzone())} to ${DateFormat(AppStrings.dateFormat).format(booking.checkOut != null ? booking.checkOut!.toISTzone() : booking.checkIn.add(Duration(days: booking.days)).toISTzone())}"),
//               Text(
//                 booking.hotel!.address.localities.map((e) => e.name).join(", "),
//                 style: const TextStyle(
//                   color: Colors.black38,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Flexible(
//                 child: Text(
//                   booking.hotel!.address.address,
//                   maxLines: 2,
//                   style: const TextStyle(
//                     color: Colors.black38,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
