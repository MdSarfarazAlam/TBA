import 'package:bta/model/booking.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InsuranceResultScreen extends StatefulWidget {
  const InsuranceResultScreen({super.key});

  @override
  State<InsuranceResultScreen> createState() => _InsuranceResultScreenState();
}

class _InsuranceResultScreenState extends State<InsuranceResultScreen> {
  final controller = WebViewController();
  bool isLoading = true;
  var loadingPercentage = 0;

  late Booking booking;
  @override
  void initState() {
    super.initState();

    String toursResultLink = AppStrings.insuranceLink;
    if (kDebugMode) {
      print("hotelResultURL ============$toursResultLink");
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
          var element = document.querySelector('.hdrRow');
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
      ..loadRequest(Uri.parse(toursResultLink));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            AppStrings.insurance,
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
