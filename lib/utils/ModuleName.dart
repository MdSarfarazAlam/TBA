import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class ModuleName with ChangeNotifier {
  List<String> moduleName = [
    'Flights',
    'Hotels',
    'Buses',
    'Car Rental',
    'Activities'
  ];
  List<dynamic> moduleClassName = [];

  List<IconData> moduleIcons = [
    Icons.flight_rounded,
    Icons.hotel,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.car,
    FontAwesomeIcons.monument,
  ];

  List<String> boxNameBelowmodule = [
    '24x7 Customer Support',
    'Secure Booking Process',
    'Trusted by Members',
    '9.27 Million Happy Members',
  ];
  List<String> boxImageIconBelowmodule = [
    'assets/24_hours_icon.png',
    'assets/shield_icon.png',
    'assets/like_icon.png',
    'assets/people_icon.png'
  ];

  List<String> imageURLCarousalActivity = [
    'assets/activity.png',
    'assets/activity1.PNG',
    'assets/activity2.PNG',
    'assets/activity3.PNG',
    'assets/activity4.PNG',
    'assets/activity5.PNG',
  ];

  TextStyle returnMyBoxBelowTopModuleStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.black45, fontSize: 10);

  // String destinationCountryName = 'India';

  String lastSelectedCurrency = 'INR';

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  String? departureDate = DateFormat('dd MMM EE,yyyy')
      .format(DateTime.now().add(const Duration(days: 5)));

  String? returnDate = DateFormat('dd MMM EE,yyyy')
      .format(DateTime.now().add(const Duration(days: 6)));

  DateTime? departureStandardDate = DateTime.now().add(const Duration(days: 5)),
      returnStandardDate = DateTime.now().add(const Duration(days: 6));
  setdepartureStandardDate({DateTime? dateX}) {
    departureStandardDate = dateX;
  }

  setreturnStandardDate({DateTime? dateX}) {
    returnStandardDate = dateX;
  }

  String convertStandardDateToFormattedDate({DateTime? dateX, israngeModeX}) {
    return DateFormat('dd MMM EE').format(dateX!);
  }

  setdepartureSelectedDateFormatted({
    String? departureDateX,
  }) {
    departureDate = departureDateX;

    notifyListeners();
  }

  setreturnSelectedDateFormatted({
    String? returnDateX,
  }) {
    returnDate = returnDateX;

    notifyListeners();
  }

  List<IconData> myAccountIconLeft = [
    LineIcons.user,
    LineIcons.cog,
    LineIcons.share,
    LineIcons.star,
    LineIcons.thumbsUpAlt,
    LineIcons.question,
    LineIcons.identificationCard,
    LineIcons.phone,
    LineIcons.helpingHands,
  ];

  TextStyle landingDestinationItemTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 10,
  );
  TextStyle buttonLoginRegStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14);
  TextStyle nameLoginRegStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14);
  TextStyle nameCardBelowCaraouselStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 14);

  TextStyle moduleNameStyle = const TextStyle(
      fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 13);

  TextStyle rechareBillPaymentHeaderStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20);
}
