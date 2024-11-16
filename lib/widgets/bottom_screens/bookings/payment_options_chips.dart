// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:seeyusoon/utils/assets.dart';
// import 'package:seeyusoon/utils/screen_size.dart';

// class PaymentOptionsChips extends StatefulWidget {
//   final int offer;
//   final bool status;
//   final Function(bool) onChange;
//   const PaymentOptionsChips(
//       {Key? key,
//       required this.offer,
//       this.status = false,
//       required this.onChange})
//       : super(key: key);

//   @override
//   State<PaymentOptionsChips> createState() => _PaymentOptionsChipsState();
// }

// class _PaymentOptionsChipsState extends State<PaymentOptionsChips> {
//   // bool _selectedchip = false;
//   // bool patathotel = true;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Stack(children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: SizedBox(
//                   height: SizeConfig.blockSizeVertical * 6,
//                   width: SizeConfig.blockSizeHorizontal * 60,
//                   child: const Image(
//                     image: AssetImage(AppAssets.paymentOptions),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               AnimatedPositioned(
//                 left: widget.status
//                     ? SizeConfig.blockSizeHorizontal * 1
//                     : SizeConfig.blockSizeHorizontal * 29,

//                 // 110 : 11,
//                 duration: const Duration(milliseconds: 150),
//                 // curve: Curves.easeIn,
//                 child: Container(
//                   margin: const EdgeInsets.all(6),
//                   width: SizeConfig.blockSizeHorizontal * 28,
//                   height: SizeConfig.blockSizeVertical * 4,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       // color: Colors.red,
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       border: Border.all(color: Colors.white)),

//                   // color:Colors.red,
//                   width: SizeConfig.blockSizeHorizontal * 60,
//                   height: SizeConfig.blockSizeVertical * 6,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           HapticFeedback.vibrate();
//                           if (!widget.status) {
//                             // setState(() {
//                             //   patathotel = true;
//                             //   _selectedchip = !_selectedchip;
//                             //   // chipbacktext = true;
//                             // });
//                             widget.onChange(false);
//                           }
//                         },
//                         child: SizedBox(
//                             //  color:  ColorCodeGen.colorFromHex('#ffd022'),
//                             width: SizeConfig.blockSizeHorizontal * 28,
//                             height: SizeConfig.blockSizeVertical * 3,
//                             child: Center(
//                                 child: Text(
//                               'Pay at hotel',
//                               style: TextStyle(
//                                   color: widget.status
//                                       ? Colors.black
//                                       : Colors.white,
//                                   fontWeight: FontWeight.normal),
//                             ))),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           HapticFeedback.vibrate();
//                           if (widget.status) {
//                             // setState(() {
//                             //   patathotel = false;
//                             //   _selectedchip = !_selectedchip;
//                             // });
//                             widget.onChange(true);
//                           }
//                         },
//                         child: SizedBox(
//                             width: SizeConfig.blockSizeHorizontal * 28,
//                             height: SizeConfig.blockSizeVertical * 3,
//                             // color:  ColorCodeGen.colorFromHex('#ffd022'),
//                             child: Center(
//                                 child: Text(
//                               'Pay now',
//                               style: TextStyle(
//                                 color:
//                                     widget.status ? Colors.white : Colors.black,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ))),
//                       ),
//                     ],
//                   )),
//             ]),
//             widget.status
//                 ? returnPaymentDiscountCard(
//                     title: 'No Discount',
//                   )
//                 : returnPaymentDiscountCard(
//                     title: '${widget.offer}% off',
//                   )
//           ],
//         ),
//       ],
//     );
//   }

//   Widget returnPaymentDiscountCard({required String title}) {
//     return Card(
//       shape: RoundedRectangleBorder(
//           side: const BorderSide(
//             color: Colors.black,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(10)),
//       shadowColor: Colors.purple,
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Text(
//             title,
//             style: const TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.normal),
//           ),
//         ),
//       ),
//     );
//   }
// }
