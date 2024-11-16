import 'package:bta/model/booking.dart';
import 'package:bta/screens/hotel/appbarSearch.dart';
import 'package:bta/services/location.service.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class HotelSearchValue extends StatefulWidget {
  const HotelSearchValue({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HotelSearchValueState createState() => _HotelSearchValueState();
}

class _HotelSearchValueState extends State<HotelSearchValue> {
  List<dynamic> data = [];
  String? textValue;
  Timer? timeHandle;
  var show = true;
  var searching = true;
  var listshow = false;
  var selectValue = "";
  void textChanged(String val) {
    setState(() {
      searching = false;

      listshow = true;
    });
    textValue = val;

    timeHandle = Timer(const Duration(microseconds: 500), () async {
      List<dynamic> data1 = await SearchLocationData().getHotelData(textValue);
      setState(() {
        searching = true;
        data = data1;
      });
    });
  }

  late Booking booking;
  @override
  void initState() {
    super.initState();
    booking = Provider.of<Booking>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    // timeHandle!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MyAppBarSearch(
            textChangedRef: textChanged, appbarTitle: "Search Locations"),
        body: Visibility(
            visible: show,
            child: searching == false
                ? const Center(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ),
                  )
                : listshow == true
                    ? ListView.separated(
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.black,
                          height: 0,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 4),
                            dense: true,
                            onTap: () async {
                              booking.cityName = data[index]["cityName"];
                              booking.locationFullName =
                                  data[index]["fullName"];
                              booking.countryCode = data[index]["countryCode"];
                              booking.cityCode = data[index]["iata"][0];
                              // await prefs.setString("hotel_city_code",
                              //     data[index]["locationId"].toString());

                              Navigator.pop(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  booking.locationFullName);
                            },
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.logoBlue,
                                ),
                                SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 4),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        data[index]["cityName"].toString(),
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: AppColors.logoBlue,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .5,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Text(
                                        data[index]["countryName"].toString(),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontWeight: FontWeight.normal,
                                              letterSpacing: .5,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      //:Container(),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    : const SizedBox()));
  }
}
