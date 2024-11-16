// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:seeyusoon/screens/bottom_screens/home/hotel_room_select.dart';
// import 'package:seeyusoon/utils/colors.dart';

// class RoomAdultChildRow extends StatelessWidget {
//   final void Function(RoomData) onRoomChanged;
//   // final int rooms;
//   // final int adults;
//   // final int children;
//   final RoomData data;
//   const RoomAdultChildRow({
//     Key? key,
//     // required this.rooms,
//     // required this.adults,
//     // required this.children,
//     required this.data,
//     required this.onRoomChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int adults = data.adults.reduce((a, b) => a + b);
//     int children = data.children.reduce((a, b) => a + b);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Room',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 )),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                   "${data.rooms} Room${data.rooms > 1 ? 's' : ''}, $adults Adult${adults > 1 ? 's' : ''}${children > 0 ? " and $children Children" : ""}",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   )),
//             ),
//           ],
//         ),
//         // SizedBox(
//         //   width: SizeConfig.blockSizeHorizontal * 14,
//         // ),
//         Container(
//           decoration: BoxDecoration(
//               color: AppColors.primary.withOpacity(.3),
//               borderRadius: BorderRadius.circular(24)),
//           // color: Colors.amber,
//           child: IconButton(
//             color: AppColors.primary,
//             onPressed: () async {
//               onRoomChanged(await Navigator.push(
//                   context,
//                   PageTransition(
//                       type: PageTransitionType.rightToLeft,
//                       child: HotelRoomsSelect(data: data))));
//             },
//             icon: const Icon(
//               Icons.edit,
//               // color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
