// import 'package:flutter/material.dart';
// import 'package:seeyusoon/utils/colors.dart';

// class ChipPrice extends StatelessWidget {
//   final int hours;
//   final int days;
//   final int price;
//   final bool isFilterCardPrice;
//   final bool available;
//   final void Function(int)? onTap;
//   const ChipPrice({
//     Key? key,
//     this.hours = 0,
//     this.days = 0,
//     required this.price,
//     required this.isFilterCardPrice,
//     this.available = true,
//     this.onTap,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.all(4.0),
//         padding: const EdgeInsets.all(4.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: price == 0 || !available ? Colors.white54 : Colors.white),
//         child: InkWell(
//           onTap: price != 0
//               ? () {
//                   if (onTap != null) {
//                     onTap!(hours);
//                   }
//                 }
//               : null,
//           child: isFilterCardPrice
//               ? Text(
//                   "$hours hours",
//                   style: const TextStyle(
//                     fontSize: 14,
//                   ),
//                 )
//               : Padding(
//                   padding: EdgeInsets.all(hours == 0 ? 4.0 : 0),
//                   child: Wrap(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     runAlignment: WrapAlignment.center,
//                     alignment: WrapAlignment.center,
//                     spacing: hours == 0 ? 4 : 0,
//                     direction: hours == 0 ? Axis.horizontal : Axis.vertical,
//                     children: price == 0 || !available
//                         ? [
//                             const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 "N.A",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.primary,
//                                 ),
//                               ),
//                             )
//                           ]
//                         : [
//                             Text(
//                               hours == 0 ? "₹${price * days}" : "₹$price",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.primary,
//                               ),
//                             ),
//                             Text(
//                               hours == 0 ? "$days days" : "$hours hours",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: AppColors.primary.withOpacity(0.7),
//                               ),
//                             ),
//                           ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
