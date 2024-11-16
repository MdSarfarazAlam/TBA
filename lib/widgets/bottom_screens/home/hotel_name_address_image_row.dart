// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:seeyusoon/utils/screen_size.dart';
// import 'package:seeyusoon/utils/string_extension.dart';

// class HotelNameAddressImageRow extends StatelessWidget {
//   final String name;
//   final String address;
//   final String image;
//   const HotelNameAddressImageRow(
//       {Key? key,
//       required this.name,
//       required this.address,
//       required this.image})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 name.toTitleCase(),
//                 style: const TextStyle(
//                   // color: Colors.grey,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 address,
//                 style: const TextStyle(
//                   color: Colors.black45,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 maxLines: 3,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         SizedBox(
//           height: SizeConfig.screenHeight * 0.1,
//           width: SizeConfig.screenWidth * 0.3,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(4.0),
//             child: CachedNetworkImage(
//               imageUrl: image,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
