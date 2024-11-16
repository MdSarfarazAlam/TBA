import 'package:bta/model/booking.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VillaResultScreen extends StatefulWidget {
  const VillaResultScreen({
    super.key,
  });

  @override
  State<VillaResultScreen> createState() => _VillaResultScreenState();
}

class _VillaResultScreenState extends State<VillaResultScreen> {
  var loadingPercentage = 0;
  late final WebViewController controller;
  late Booking booking;
  @override
  void initState() {
    super.initState();
    booking = Provider.of<Booking>(context, listen: false);
    String roomGuestsParam =
        '{"Adults":${booking.adults.toString()},"Children":${booking.children.toString()},"Index":1}';
    String checkInDate = context
        .read<ModuleName>()
        .departureStandardDate
        .toString()
        .split(" ")[0];
    String checkOutDate =
        context.read<ModuleName>().returnStandardDate.toString().split(" ")[0];

    String villaParams = "?location_name=${booking.cityName}";
    String villaResultURL = AppStrings.villaLink + villaParams;
    if (kDebugMode) {
      print("villaResultURL ============$villaResultURL");
    }
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(villaResultURL),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          AppStrings.resultVilla,
          style: TextStyle(color: AppColors.white, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
