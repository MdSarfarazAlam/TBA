// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/locality.dart';
// import 'package:seeyusoon/utils/colors.dart';
// import 'package:seeyusoon/utils/strings.dart';

// class AddressRatingBar extends StatelessWidget {
//   final List<Locality> localities;
//   final int rating;
//   final int ratingCount;
//   const AddressRatingBar(
//       {Key? key,
//       required this.localities,
//       required this.rating,
//       required this.ratingCount})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log(localities.map((e) => e.name).toList().toString());
//     log("====================");
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             localities.map((e) => e.name).join(", "),
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(color: AppColors.primary.withOpacity(.5)),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                 color: AppColors.primary.withOpacity(.7),
//               )),
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             const SizedBox(width: 4),
//             Icon(
//               Icons.star,
//               color: AppColors.primary.withOpacity(.7),
//               size: 14,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Text(
//                 "$rating.0",
//                 style: const TextStyle(fontSize: 10),
//               ),
//             ),
//             Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                   color: AppColors.primary.withOpacity(.7),
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(4),
//                     bottomRight: Radius.circular(4),
//                   )),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
//                 child: Text(
//                   "$ratingCount ${AppStrings.ratings}",
//                   style: const TextStyle(fontSize: 10, color: Colors.white),
//                 ),
//               ),
//             )
//           ]),
//         )
//       ],
//     );
//   }
// }
