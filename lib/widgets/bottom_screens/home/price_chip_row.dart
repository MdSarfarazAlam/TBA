// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/price.dart';
// import 'package:seeyusoon/utils/colors.dart';
// import 'package:seeyusoon/widgets/bottom_screens/home/chip_price.dart';

// class PriceChipRow extends StatelessWidget {
//   final bool isFilterCardPrice;
//   final Price? price;
//   final bool available;
//   final void Function(int)? onTap;
//   final int stay;
//   const PriceChipRow(
//       {Key? key,
//       required this.isFilterCardPrice,
//       this.price,
//       this.onTap,
//       this.available = true,
//       this.stay = 0})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: !isFilterCardPrice ? AppColors.primary.withOpacity(0.2) : null,
//       padding: const EdgeInsets.all(4.0),
//       child: Row(
//         children: stay == 0
//             ? [
//                 ChipPrice(
//                     hours: 3,
//                     onTap: onTap,
//                     price: !isFilterCardPrice ? price!.p3 : 599,
//                     available: available,
//                     isFilterCardPrice: isFilterCardPrice),
//                 ChipPrice(
//                     hours: 6,
//                     onTap: onTap,
//                     available: available,
//                     price: !isFilterCardPrice ? price!.p6 : 599,
//                     isFilterCardPrice: isFilterCardPrice),
//                 ChipPrice(
//                     hours: 12,
//                     onTap: onTap,
//                     available: available,
//                     price: !isFilterCardPrice ? price!.p12 : 599,
//                     isFilterCardPrice: isFilterCardPrice),
//               ]
//             : [
//                 ChipPrice(
//                     days: stay,
//                     onTap: onTap,
//                     available: available,
//                     price: !isFilterCardPrice ? price!.p24 : 599,
//                     isFilterCardPrice: isFilterCardPrice)
//               ],
//       ),
//     );
//   }
// }
