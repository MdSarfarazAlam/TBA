import 'dart:convert';

import 'package:bta/model/booking.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HotelResultScreen extends StatefulWidget {
  const HotelResultScreen({super.key});

  @override
  State<HotelResultScreen> createState() => _HotelResultScreenState();
}

class _HotelResultScreenState extends State<HotelResultScreen> {
  final controller = WebViewController();
  bool isLoading = true;
  var loadingPercentage = 0;

  late Booking booking;
  @override
  void initState() {
    super.initState();

    booking = Provider.of<Booking>(context, listen: false);
    // String roomGuestsParam =
    //     '{"Adults":${booking.adults.toString()},"Children":${booking.children.toString()},"Index":1}';
    // String checkInDate = context
    //     .read<ModuleName>()
    //     .departureStandardDate
    //     .toString()
    //     .split(" ")[0];
    // String checkOutDate =
    //     context.read<ModuleName>().returnStandardDate.toString().split(" ")[0];

    // String hotelParams =
    //     "?city=${booking.cityName}&countryCode=${booking.countryCode}&checkIn=$checkInDate&checkOut=$checkOutDate&passengers=$roomGuestsParam";

    // String hotelResultURL = AppStrings.hotelLink + hotelParams;

    //import 'dart:convert'; // For Uri encoding

//     String roomGuestsParam = jsonEncode(
//         {"Adults": booking.adults, "Children": booking.children, "Index": 1});

    String checkInDate = context
        .read<ModuleName>()
        .departureStandardDate
        .toString()
        .split(" ")[0];
    String checkOutDate =
        context.read<ModuleName>().returnStandardDate.toString().split(" ")[0];

// // URL encode the parameters
//     String encodedRoomGuestsParam = Uri.encodeComponent(roomGuestsParam);

//     String hotelParams =
//         "?city=${booking.cityName}&countryCode=${booking.countryCode}&checkIn=$checkInDate&checkOut=$checkOutDate&passengers=$encodedRoomGuestsParam";

//     String hotelResultURL = AppStrings.hotelLink + hotelParams;

    // String city = booking.cityName!;
    //String cityCode = "YTO";
    // String countryCode = booking.countryCode!;

    // Define passenger details as a Map and convert it to a JSON string
    Map<String, dynamic> passengers = {
      "Adults": booking.adults,
      "Children": booking.children,
      "Index": 1,
      "ChildAges": ""
    };

    // Encode the passengers object to JSON and then URL encode it
    String encodedPassengers = Uri.encodeComponent(jsonEncode([passengers]));

    // Construct the URL
    String offset = "1"; // As per your example
    String hotelResultURL =
        "https://booking.travelbta.com/hotels/availablehotels"
        "?city=${booking.cityName}"
        "&cityCode=${booking.cityCode}"
        "&countryCode=${booking.countryCode}"
        "&checkIn=$checkInDate"
        "&checkOut=$checkOutDate"
        "&passengers=$encodedPassengers"
        "&offset=$offset";

    //print(hotelResultURL);

    //print(hotelResultURL);

    if (kDebugMode) {
      print("hotelResultURL ============$hotelResultURL");
    }
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          Future.delayed(const Duration(milliseconds: 5000), () {
            controller.runJavaScript(r'''
          var element = document.querySelector('.sticky');
          if (element) {
            // console.log('sarfaraz Element  found==========='+element.length);
            //  console.log('sarfaraz Element  found==========='+element.innerHTML);
              element.style.display="none";
          } else {
            console.log('sarfaraz Element not found');
          }
           var element2 = document.querySelector('.p-3');
          if (element2) {
            console.log('sarfaraz 2 Element  found==========='+element2.length);
             console.log('sarfaraz 2 Element  found==========='+element2.innerHTML);
              element2.style.display="none";
          } else {
            console.log('sarfaraz 2 Element not found');
          }

          var element1 = document.querySelector('.mt-10');
          if (element1) {
            console.log('sarfaraz Element  found==========='+element1.length);
             console.log('sarfaraz Element  found==========='+element1.innerHTML);
              element1.style.display="none";
          } else {
            console.log('sarfaraz 1 Element not found');
          }


         

      
        ''');
          });
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (WebResourceError error) {
          //Things to do when the page has error when loading
        },
      ))
      ..loadRequest(Uri.parse(hotelResultURL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            AppStrings.resultHotel,
            style:
                TextStyle(color: AppColors.white, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: (isLoading)
            ? const Center(child: CupertinoActivityIndicator())
            : Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: WebViewWidget(
                  controller: controller,
                ),
              ));
  }
}
