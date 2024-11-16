// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:seeyusoon/model/booking.dart';
// import 'package:seeyusoon/services/booking.service.dart';
// import 'package:seeyusoon/services/razorpay.service.dart';
// import 'package:seeyusoon/utils/screen_size.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/booking_amout_row.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/dotted_line.dart';
// import 'package:seeyusoon/widgets/bottom_screens/bookings/payment_options_chips.dart';
// import 'package:seeyusoon/widgets/my_button.dart';

// class UnpaidBookingOptions extends StatefulWidget {
//   final Booking booking;
//   const UnpaidBookingOptions({Key? key, required this.booking})
//       : super(key: key);

//   @override
//   State<UnpaidBookingOptions> createState() => _UnpaidBookingOptionsState();
// }

// class _UnpaidBookingOptionsState extends State<UnpaidBookingOptions> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const DottedLine(),
//         const SizedBox(
//           height: 16,
//         ),
//         if (widget.booking.hotel!.price.offer != 0) ...[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                     'Pay now and get ${widget.booking.hotel!.price.offer}% off',
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold)),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 PaymentOptionsChips(
//                     offer: widget.booking.hotel!.price.offer,
//                     onChange: (bool status) {
//                       setState(() {
//                         widget.booking.paymentMethod =
//                             status ? "Pay Online" : "Pay at Hotel";
//                       });
//                     },
//                     status: widget.booking.paymentMethod == "Pay at Hotel"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 BookingAmountRow(
//                   title: 'Total Amount',
//                   amount:
//                       '₹${widget.booking.paymentMethod == "Pay at Hotel" ? widget.booking.offlinePrice : widget.booking.onlinePrice}',
//                 ),
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: DottedLine(),
//           )
//         ],
//         MyButton(
//           title: 'Pay ₹${widget.booking.onlinePrice} now',
//           textColor: Colors.black,
//           onPressed: widget.booking.paymentMethod != "Pay at Hotel" ||
//                   widget.booking.hotel!.price.offer == 0
//               ? () {
//                   showDialog(
//                       barrierDismissible: false,
//                       context: context,
//                       builder: (context) => AlertDialog(
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: const [
//                                 Center(child: CircularProgressIndicator()),
//                                 SizedBox(height: 16),
//                                 Text("Loading, please wait ..."),
//                               ],
//                             ),
//                           ));
//                   widget.booking.paymentMethod = "Pay Online";
//                   Provider.of<RazorPayServices>(context, listen: false)
//                       .openPayment(context: context, booking: widget.booking)
//                       .then((value) {
//                     Provider.of<BookingServices>(context).getUpcomingBookings();
//                   });
//                 }
//               : null,
//           borderRadius: 5,
//           size: Size(SizeConfig.screenWidth - 36, 50),
//           color: Colors.amber,
//         )
//       ],
//     );
//   }
// }
