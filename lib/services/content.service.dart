// import 'package:bta/utils/keys.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ContentServices {
//   static String covidSafety = '';
//   static String hotelPolicy = '';
//   static String cancellationPolicy = '';
//   static String phone = '';
//   static String email = '';
//   static String address = '';
//   static String addressEmbed = '';
//   static String aboutUs = '';
//   static String facebook = '';
//   static String instagram = '';
//   static String linkedin = '';
//   static String twitter = '';

//   final CollectionReference<Map<String, dynamic>> _contents =
//       FirebaseFirestore.instance.collection(Keys.contents);

//   Future<String> getContent(String id) async {
//     try {
//       final DocumentSnapshot<Map<String, dynamic>> document =
//           await _contents.doc(id).get();
//       return document.data()![Keys.content];
//     } catch (e) {
//       return '';
//     }
//   }

//   init() async {
//     cancellationPolicy = await getContent(Keys.cancellationPolicy);
//     covidSafety = await getContent(Keys.covidSafety);
//     hotelPolicy = await getContent(Keys.hotelPolicy);
//     phone = await getContent(Keys.phone);
//     email = await getContent(Keys.email);
//     address = await getContent(Keys.address);
//     aboutUs = await getContent(Keys.aboutUs);
//     addressEmbed = await getContent(Keys.addressEmbed);
//     facebook = await getContent(Keys.facebook);
//     instagram = await getContent(Keys.instagram);
//     linkedin = await getContent(Keys.linkedin);
//     twitter = await getContent(Keys.twitter);
//   }

//   Future<void> getPhone() async {
//     if (phone.isEmpty) {
//       await getContent(Keys.phone);
//     }
//   }

//   Future<void> getEmail() async {
//     if (email.isEmpty) {
//       await getContent(Keys.email);
//     }
//   }

//   Future<void> getAddress() async {
//     if (address.isEmpty) {
//       await getContent(Keys.address);
//     }
//   }

//   Future<void> getAddressEmbed() async {
//     if (addressEmbed.isEmpty) {
//       await getContent(Keys.addressEmbed);
//     }
//   }
// }
