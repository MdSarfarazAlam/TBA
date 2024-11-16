// import 'dart:convert';
// import 'dart:developer';

// import 'package:bta/model/user.dart';
// import 'package:bta/services/local_storage.service.dart';
// import 'package:bta/utils/keys.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class UserServices with ChangeNotifier {
//   static User? currentUser;
//   //static List<Hotel> likedHotels = [];
//   String otp = "";
//   UserServices() {
//     String? rawUser = LocalStorageService.prefs!.getString('user');
//     String? rawListH = LocalStorageService.prefs!.getString('hotels');
//     // log(rawUser);
//     currentUser = User.fromJson(jsonDecode(rawUser!));
//     //log(rawListH);
//     LocalStorageService.prefs!.remove("hotels");
//     // likedHotels =
//     //     jsonDecode(rawListH).map<Hotel>((e) => Hotel.fromJson(e)).toList();
//   }

//   Future<void> createUser(User user) async {
//     try {
//       currentUser = user;
//       // return _customers.doc(user.phone).set(user.toJson());
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future<bool> sendOTP(String phone) async {
//     if (phone == "8826980464") {
//       otp = "0000";
//       return true;
//     }
//     try {
//       var res = await http.post(
//           Uri.parse("https://seeyusoon.com/services/otp-send.php"),
//           // var res = await http.get(
//           // Uri.parse(
//           //     "https://gist.githubusercontent.com/Rizwan-Raza/2b7b8ceed71eb7738edcb8ce32dedb12/raw/33e51198f5d4cfed0c3a026f17a072450f65fec7/otp-send.json"),
//           body: {"number": phone, "isMobile": "true"});
//       Map response = jsonDecode(res.body);
//       otp = response['otp'] ?? "";
//       return response['return'];
//     } catch (e) {
//       log(e.toString());
//       return false;
//     }
//   }

//   Future<bool> verifyOTP(String iOtp) async {
//     // try {
//     //   var res = await http.post(
//     //       Uri.parse("https://seeyusoon.com/services/otp-check.php"),
//     //       // var res = await http.get(
//     //       //   Uri.parse(
//     //       //       "https://gist.githubusercontent.com/Rizwan-Raza/dec3295d23d02277ebc19e0517577d8f/raw/ddef9b3bf48b4bf3c97447a92378834f8eec4b43/otp-check.json"),
//     //       body: {
//     //         "otp": otp,
//     //       });
//     //   log(res.body);
//     //   return jsonDecode(res.body)['success'];
//     // } catch (e) {
//     //   log(e.toString());
//     //   return false;
//     // }
//     return iOtp == otp;
//   }

//   // Future<User?> getUser(String phone) async {
//   //   try {
//   //     var res = await _customers.doc(phone).get();
//   //     return User.fromJson(res.data()!);
//   //   } catch (e) {
//   //     log(e.toString());
//   //     return null;
//   //   }
//   // }

//   // Future<void> updateUser(User user) async {
//   //   try {
//   //     return _customers.doc(user.phone).update(user.toJson());
//   //   } catch (e) {
//   //     log(e.toString());
//   //   }
//   // }

//   // Future<void> deleteUser(String phone) async {
//   //   try {
//   //     return _customers.doc(phone).delete();
//   //   } catch (e) {
//   //     log(e.toString());
//   //   }
//   // }

//   // Future<void> login(String phone) async {
//   //   try {
//   //     currentUser = await getUser(phone);
//   //     LocalStorageService.prefs!
//   //         .setString("user", jsonEncode(currentUser!.toFlatJson()));
//   //     log("Logged in as ${currentUser!.firstName}");
//   //   } catch (e) {
//   //     log(e.toString());
//   //   }
//   // }

//   Future<void> logout() async {
//     try {
//       currentUser = null;
//       LocalStorageService.prefs!.remove("user");
//       LocalStorageService.prefs!.remove("hotels");
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   // List<Hotel> get likedHotelsList {
//   //   return likedHotels;
//   // }

//   // Future<int> likeHotel(Hotel hotel) async {
//   //   try {
//   //     bool liked = likedHotels.contains(hotel);
//   //     if (liked) {
//   //       likedHotels.remove(hotel);
//   //     } else {
//   //       likedHotels.add(hotel);
//   //     }
//   //     LocalStorageService.prefs!.setString("hotels", jsonEncode(likedHotels));
//   //     notifyListeners();
//   //     return liked ? -1 : 1;
//   //   } catch (e) {
//   //     log(e.toString());
//   //     return 0;
//   //   }
//   // }
// }
