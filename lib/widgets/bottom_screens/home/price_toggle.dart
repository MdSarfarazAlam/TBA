// import 'package:flutter/material.dart';
// import 'package:seeyusoon/model/price.dart';
// import 'package:seeyusoon/utils/colors.dart';
// import 'package:seeyusoon/utils/keys.dart';
// import 'package:seeyusoon/utils/screen_size.dart';

// class PriceToggleButtons extends StatelessWidget {
//   final void Function(int)? onPressed;
//   final List<bool> isSelected;
//   final Price price;
//   const PriceToggleButtons(
//       {Key? key, this.onPressed, required this.isSelected, required this.price})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ToggleButtons(
//       direction: Axis.horizontal,
//       onPressed: onPressed,
//       constraints: BoxConstraints(
//           minWidth: (SizeConfig.screenWidth - 36) / 3, minHeight: 40),
//       isSelected: isSelected,
//       borderRadius: BorderRadius.circular(12),
//       color: AppColors.primary,
//       selectedColor: Colors.white,
//       fillColor: AppColors.primary,
//       children: Keys.hours
//           .asMap()
//           .entries
//           .map((e) => Text(((e.key == 0 && price.p3 != 0) ||
//                   (e.key == 1 && price.p6 != 0) ||
//                   (e.key == 2 && price.p12 != 0))
//               ? "${e.value} Hours"
//               : "NA"))
//           .toList(),
//     );
//   }
// }
