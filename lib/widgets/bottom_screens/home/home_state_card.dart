// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:seeyusoon/model/booking.dart';
// import 'package:seeyusoon/model/location.dart';
// import 'package:seeyusoon/model/state.dart';
// import 'package:seeyusoon/screens/search_screens/hotel_result_screen.dart';
// import 'package:seeyusoon/services/hotel.service.dart';

// class HomeStateCard extends StatelessWidget {
//   final StateModel state;
//   const HomeStateCard({Key? key, required this.state}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Location selectedLocation = Location.fromState(state);
//         Provider.of<HotelServices>(context, listen: false).getLocationHotels(
//           location: selectedLocation,
//         );
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelResultScreen(
//               booking: Booking.empty(),
//               selectedLocation: selectedLocation,
//             ),
//           ),
//         );
//       },
//       child: SizedBox(
//         width: 80,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: CachedNetworkImageProvider(
//                 state.image,
//               ),
//               radius: 30,
//             ),
//             SizedBox(
//                 height: 36,
//                 child: Center(
//                   child: Text(state.name,
//                       textAlign: TextAlign.center,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
