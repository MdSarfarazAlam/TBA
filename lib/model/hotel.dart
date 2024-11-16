// import 'package:bta/model/address.dart';

// //

// class Hotel {
//   String name;
//   DateTime addedOn;
//   Address address;
//   // List<Amenity> amenities;
//   String cancellationPolicy;
//   bool couple;
//   String covidSafetyMeasures;
//   String phone;
//   String email;
//   List<String> gallery;
//   bool haveHotelPolicy;
//   String hotelID;
//   String hotelPolicy;
//   bool isCancellation;
//   bool isCovidSafe;
//   bool availability;
//   // Price price;
//   int rating;
//   int ratingCount;

//   Hotel(
//       {required this.name,
//       required this.addedOn,
//       required this.address,
//       // required this.amenities,
//       required this.cancellationPolicy,
//       required this.couple,
//       required this.covidSafetyMeasures,
//       required this.phone,
//       required this.email,
//       required this.gallery,
//       required this.haveHotelPolicy,
//       required this.hotelID,
//       required this.hotelPolicy,
//       required this.isCancellation,
//       required this.isCovidSafe,
//       required this.availability,
//       // required this.price,
//       required this.rating,
//       required this.ratingCount});

//   factory Hotel.empty() => Hotel(
//         name: '',
//         addedOn: DateTime.now(),
//         address: Address.empty(),
//         // amenities: [],
//         cancellationPolicy: '',
//         couple: false,
//         covidSafetyMeasures: '',
//         phone: '',
//         email: '',
//         gallery: [],
//         haveHotelPolicy: false,
//         hotelID: '',
//         hotelPolicy: '',
//         isCancellation: false,
//         isCovidSafe: false,
//         availability: true,
//         // price: Price.empty(),
//         rating: 0,
//         ratingCount: 0,
//       );

//   factory Hotel.fromJson(Map<String, dynamic> json) {
//     return Hotel(
//       name: json['name'],
//       addedOn: json['addedOn'] is String
//           ? DateTime.parse(json['addedOn'])
//           : (json['addedOn'] as Timestamp).toDate(),
//       address: Address.fromJson(json['address']),
//       // amenities: json['amenities'] != null
//       //     ? (json['amenities'] as List).map((i) => Amenity.fromJson(i)).toList()
//       //     : [],
//       cancellationPolicy: json['cancellationPolicy'],
//       couple: json['couple'],
//       covidSafetyMeasures: json['covidSafetyMeasures'],
//       phone: json['phone'],
//       email: json['email'],
//       gallery: json['gallery'] != null
//           ? (json['gallery'] as List).map((i) => i.toString()).toList()
//           : [],
//       hotelID: json['hotelID'],
//       haveHotelPolicy: json['haveHotelPolicy'],
//       hotelPolicy: json['hotelPolicy'],
//       isCancellation: json['isCancellation'],
//       isCovidSafe: json['isCovidSafe'],
//       availability: json['availability'] ?? true,
//       //price: Price.fromJson(json['price']),
//       rating: json['rating'],
//       ratingCount: json['ratingCount'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'addedOn': addedOn.toIso8601String(),
//       'address': address.toJson(),
//       // 'amenities': amenities.map((i) => i.toJson()).toList(),
//       'cancellationPolicy': cancellationPolicy,
//       'couple': couple,
//       'covidSafetyMeasures': covidSafetyMeasures,
//       'phone': phone,
//       'email': email,
//       'gallery': gallery,
//       'haveHotelPolicy': haveHotelPolicy,
//       'hotelID': hotelID,
//       'hotelPolicy': hotelPolicy,
//       'isCancellation': isCancellation,
//       'isCovidSafe': isCovidSafe,
//       'availability': availability,
//       // 'price': price.toJson(),
//       'rating': rating,
//       'ratingCount': ratingCount,
//     };
//   }

//   @override
//   String toString() {
//     return 'Hotel{name: $name, addedOn: $addedOn, address: $address, cancellationPolicy: $cancellationPolicy, couple: $couple, covidSafetyMeasures: $covidSafetyMeasures, phone: $phone, email: $email, gallery: $gallery, haveHotelPolicy: $haveHotelPolicy, hotelID: $hotelID, hotelPolicy: $hotelPolicy, isCancellation: $isCancellation, isCovidSafe: $isCovidSafe, availability: $availability, rating: $rating, ratingCount: $ratingCount}';
//   }
// }
