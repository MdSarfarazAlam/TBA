// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/hotel.dart';
// import 'package:seeyusoon/utils/screen_size.dart';
// import 'package:seeyusoon/utils/string_extension.dart';
// import 'package:seeyusoon/utils/strings.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/address_rating_bar.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/hotel_type_chip.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/payment_type_chip.dart';

// class CarouselHotelCard extends StatefulWidget {
//   final Hotel hotel;
//   const CarouselHotelCard({Key? key, required this.hotel}) : super(key: key);

//   @override
//   State<CarouselHotelCard> createState() => _CarouselHotelCardState();
// }

// class _CarouselHotelCardState extends State<CarouselHotelCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.5),
//               child: ClipRRect(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 borderRadius: BorderRadius.circular(0.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       // color: Colors.red,
//                       borderRadius: BorderRadius.circular(0)),
//                   width: SizeConfig.blockSizeHorizontal * 100,
//                   height: SizeConfig.blockSizeVertical * 22,
//                   child: CachedNetworkImage(
//                     imageUrl: widget.hotel.gallery[0],
//                     fit: BoxFit.cover,
//                     // height: 1.0,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.5),
//               child: Container(
//                 width: SizeConfig.blockSizeHorizontal * 100,
//                 height: SizeConfig.blockSizeVertical * 22,
//                 decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                         colors: [
//                       Colors.black38,
//                       Colors.black12,
//                     ])),
//               ),
//             ),
//             Positioned(
//                 top: 0, right: 0, child: ratingChip(widget.hotel.rating)),
//             Positioned(
//                 bottom: 16,
//                 left: 16,
//                 child: hotelTitle(widget.hotel.name.toTitleCase())),
//             Positioned(
//                 bottom: 16,
//                 right: 16,
//                 child: hotelPrice("₹${widget.hotel.price.p3}")),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2.5),
//           child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Colors.deepPurple.withOpacity(.2),
//                   Colors.deepPurple.withOpacity(.2),
//                 ]),
//               ),
//               height: SizeConfig.blockSizeVertical * 8,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     AddressRatingBar(
//                       localities: widget.hotel.address.localities,
//                       rating: widget.hotel.rating,
//                       ratingCount: widget.hotel.ratingCount,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           if (widget.hotel.couple) ...[
//                             const HotelTypeChip(),
//                             const SizedBox(width: 4)
//                           ],
//                           if (widget.hotel.price.method
//                               .contains(AppStrings.payAtHotel))
//                             const PaymentTypeChip()
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               )),
//         ),
//       ],
//     );
//   }

//   Widget hotelTitle(String text) {
//     return SizedBox(
//       width: SizeConfig.screenWidth / 1.5,
//       child: Text(
//         text,
//         overflow: TextOverflow.ellipsis,
//         style: const TextStyle(fontSize: 20, color: Colors.white),
//       ),
//     );
//   }

//   Widget hotelPrice(String text) {
//     return Text(
//       text,
//       overflow: TextOverflow.ellipsis,
//       style: const TextStyle(fontSize: 20, color: Colors.white),
//     );
//   }

//   Widget ratingChip(int rating) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       width: SizeConfig.blockSizeHorizontal * 22,
//       height: SizeConfig.blockSizeVertical * 3,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(20)),
//       child: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Text(
//           '$rating.0 ${AppStrings.ratings}',
//           style: const TextStyle(fontSize: 12, color: Colors.black),
//         ),
//       )),
//     );
//   }
// }
