// import 'package:bta/model/address.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapWidget extends StatelessWidget {
//   final Address address;
//   const GoogleMapWidget({super.key, required this.address});

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapType: MapType.normal,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(address.lat, address.lng),
//         zoom: 15.0,
//       ),
//       markers: {
//         Marker(
//             markerId: MarkerId(address.url),
//             position: LatLng(address.lat, address.lng),
//             infoWindow: InfoWindow(title: address.address))
//       },
//     );
//   }
// }
