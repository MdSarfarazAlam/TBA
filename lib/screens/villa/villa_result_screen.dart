import 'package:bta/model/booking.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class VillaResultScreen extends StatefulWidget {
//   const VillaResultScreen({
//     super.key,
//   });

//   @override
//   State<VillaResultScreen> createState() => _VillaResultScreenState();
// }

// class _VillaResultScreenState extends State<VillaResultScreen> {
//   var loadingPercentage = 0;
//   late final WebViewController controller;
//   late Booking booking;
//   @override
//   void initState() {
//     super.initState();
//     booking = Provider.of<Booking>(context, listen: false);
//     String roomGuestsParam =
//         '{"Adults":${booking.adults.toString()},"Children":${booking.children.toString()},"Index":1}';
//     String checkInDate = context
//         .read<ModuleName>()
//         .departureStandardDate
//         .toString()
//         .split(" ")[0];
//     String checkOutDate =
//         context.read<ModuleName>().returnStandardDate.toString().split(" ")[0];

//     String villaParams = "?location_name=${booking.cityName}";
//     String villaResultURL = AppStrings.villaLink + villaParams;
//     if (kDebugMode) {
//       print("villaResultURL ============$villaResultURL");
//     }
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageStarted: (url) {
//           setState(() {
//             loadingPercentage = 0;
//           });
//         },
//         onProgress: (progress) {
//           setState(() {
//             loadingPercentage = progress;
//           });
//         },
//         onPageFinished: (url) {
//           setState(() {
//             loadingPercentage = 100;
//           });
//         },
//       ))
//       ..loadRequest(
//         Uri.parse(villaResultURL),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           AppStrings.resultVilla,
//           style: TextStyle(color: AppColors.white, fontStyle: FontStyle.italic),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(
//             controller: controller,
//           ),
//           if (loadingPercentage < 100)
//             LinearProgressIndicator(
//               value: loadingPercentage / 100.0,
//             ),
//         ],
//       ),
//     );
//   }
// }

class VillaResultScreen extends StatefulWidget {
  const VillaResultScreen({super.key});

  @override
  State<VillaResultScreen> createState() => _VillaResultScreenState();
}

class _VillaResultScreenState extends State<VillaResultScreen> {
  final controller = WebViewController();
  bool isLoading = true;
  var loadingPercentage = 0;

  late Booking booking;
  @override
  void initState() {
    super.initState();

    String villaResultURL = AppStrings.villaLink;
    if (kDebugMode) {
      print("hotelResultURL ============$villaResultURL");
    }
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          Future.delayed(const Duration(milliseconds: 50), () {
            controller.runJavaScript(r'''
          var element = document.querySelector('.header__left');
          if (element) {
            // console.log('sarfaraz Element  found==========='+element.length);
            //  console.log('sarfaraz Element  found==========='+element.innerHTML);
              element.style.display="none";
          } else {
            console.log('sarfaraz Element not found');
          }
           var element2 = document.querySelector('.header__center');
          if (element2) {
            console.log('sarfaraz 2 Element  found==========='+element2.length);
             console.log('sarfaraz 2 Element  found==========='+element2.innerHTML);
              element2.style.display="none";
          } else {
            console.log('sarfaraz 2 Element not found');
          }

          var element1 = document.querySelector('.header__right');
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
      ..loadRequest(Uri.parse(villaResultURL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            AppStrings.resultVilla,
            style:
                TextStyle(color: AppColors.white, fontStyle: FontStyle.normal),
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
