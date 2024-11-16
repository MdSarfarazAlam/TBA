// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/hotel.dart';
// import 'package:seeyusoon/utils/colors.dart';
// import 'package:seeyusoon/utils/string_extension.dart';
// import 'package:seeyusoon/utils/strings.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/address_rating_bar.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/hotel_type_chip.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/payment_type_chip.dart';

// class HotelAddressRatingPayment extends StatelessWidget {
//   final Hotel hotel;
//   const HotelAddressRatingPayment({Key? key, required this.hotel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log(hotel.name);
//     log(hotel.address.localities.map((e) => e.name).toList().toString());
//     log("--------------------");
//     return Column(
//       // mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       // mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 hotel.name.toTitleCase(),
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w600, color: AppColors.primary),
//               ),
//             ),
//             // const Text(
//             //   "Rs 1999",
//             //   style: TextStyle(color: AppColors.primary),
//             // )
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         AddressRatingBar(
//             localities: hotel.address.localities,
//             rating: hotel.rating,
//             ratingCount: hotel.ratingCount),
//         const SizedBox(
//           height: 5,
//         ),
//         Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if (hotel.couple) const HotelTypeChip(),
//             if (hotel.price.method.contains(AppStrings.payAtHotel))
//               const PaymentTypeChip()
//           ],
//         )
//       ],
//     );
//   }
// }
