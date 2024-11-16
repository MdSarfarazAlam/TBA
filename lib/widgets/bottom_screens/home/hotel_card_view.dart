// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:seeyusoon/model/hotel.dart';
// import 'package:seeyusoon/services/user.service.dart';
// import 'package:seeyusoon/utils/screen_size.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/hotel_address_rating_payment.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/price_chip_row.dart';

// class HotelCardView extends StatelessWidget {
//   final Hotel hotel;
//   final void Function(int)? onTap;
//   final int stay;
//   final bool isFavourite;
//   const HotelCardView(
//       {Key? key,
//       required this.hotel,
//       this.onTap,
//       this.stay = 0,
//       this.isFavourite = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // shadowColor: Colors.grey,
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       clipBehavior: Clip.antiAlias,
//       margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         Stack(
//           children: [
//             SizedBox(
//                 width: SizeConfig.screenWidth,
//                 height: SizeConfig.blockSizeVertical * 22,
//                 child: CachedNetworkImage(
//                   imageUrl: hotel.gallery.first,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 )),
//             if (isFavourite)
//               Positioned(
//                   top: 8,
//                   right: 8,
//                   child: IconButton(
//                       icon: const Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       ),
//                       onPressed: () {
//                         Provider.of<UserServices>(context, listen: false)
//                             .likeHotel(hotel)
//                             .then((value) {
//                           if (value != 0) {
//                             if (value == 1) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content:
//                                       Text('Hotel added to your favorites'),
//                                 ),
//                               );
//                               // setState(() {
//                               //   isFav = true;
//                               // });
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content:
//                                       Text('Hotel removed from your favorites'),
//                                 ),
//                               );
//                               // setState(() {
//                               //   isFav = false;
//                               // });
//                             }
//                           }
//                         });
//                       })),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: HotelAddressRatingPayment(hotel: hotel),
//         ),
//         const SizedBox(height: 5),
//         PriceChipRow(
//             isFilterCardPrice: false,
//             price: hotel.price,
//             onTap: onTap,
//             available: hotel.availability,
//             stay: stay),
//       ]),
//     );
//   }
// }
