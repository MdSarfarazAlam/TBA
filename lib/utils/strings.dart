import 'package:bta/model/faq.dart';

class AppStrings {
  static const String appName = 'Boutique Travel Advisors';
  // main.dart
  static const String isFirstTime = 'isFirstTime';
  static const String manageBookingText = 'Manage Bookings';
  static const String manageBookingLink =
      'https://dashboard.travelbta.com/index.php?action=Login&module=Users';

  static const String planItiText = 'Plan your itinerary with us';
  static const String planItiLink = 'https://booking.travelbta.com/contact-us';

  static const String blogTitle =
      'Click to see latest blogs of Hotels, Villas, Tours';
  static const String blogLink = 'https://travelbta.com/luxury-blog/';

  static const String hotelLink =
      "https://booking.travelbta.com/hotels/availablehotels";

  static const String villaLink = "https://luxuryvillas.travelbta.com/";
  static const String toursLink = "https://tours.travelbta.com/";

  static const String insuranceLink =
      "https://partner.roamright.com/?agencycode=BoutiqueTravelAdvisors";

  //sections
  static const String hotel = 'Hotels';
  static const String villa = 'Villas';
  static const String experiences = 'Tours';
  static const String insurance = 'Insurance';

  // login.dart
  static const String login = 'Login';
  static const String otpPrefix = 'We will send you an';
  static const String otp = 'One Time Password';
  static const String otpSuffix = 'on this mobile number';
  static const String phoneNumber = 'Phone number';
  static const String phoneNumberRequired = 'Please enter your phone';
  static const String phoneNumberInvalid = 'Please enter a valid phone number';
  static const String loading = 'Loading ...';
  static const String verify = 'Verify';
  static const String dontHaveAccount = "Don't have an account?";
  static const String signUp = "Sign Up";
  // otp.dart
  static const String areUSure = "Are you sure?";
  static const String changeNumberQ = "Do you want to change your number?";
  static const String no = "No";
  static const String yes = "Yes";
  static const String cancel = "Cancel";
  static const String verficationCode = "Verification Code";
  static const String verficationCodeEnter =
      "Please type verification code sent to your number";
  static const String otpError = "Invalid OTP";
  static const String noCode = "I don't recieve a code!";
  static const String resend = "Please resend";
  // signup.dart
  static const String haveAccountQ = "Already have an account?";
  // home.dart
  static const String greetGuestHello = "Hello, ";
  static const String greetGuestBook = " Book your stay";
  static const String recommendedHotels = "Recommended hotels for you";
  static const String ratings = "ratings";
  static const String coupleType = "Couple friendly | Local ID Accepted";
  static const String payAtHotel = "Pay at Hotel";

  static const String covid19 = "COVID-19 Guidelines";
  // static const String travelSite = "The Way You Book The Travel Matters";

  static const String homeCard = "BTA Exclusive Amenities";

  static const List<String> homeCardTitle = [
    "VIP Welcome & Special Anemities *",
    "\$100 Hotel / Resort Cedit *",
    "Priority For Room Upgrade *",
    "Continental Breakfast Daily *",
    "Extended Check-in/out Whenever Possible *",
  ];

  // static const List<String> homeCardSubTitle = [
  //   "BOOK YOUR STAY WITH BTA TO RECEIVE EXCLUSIVE AMENITIES.",
  //   "we allow bookings for unmarried couples. We accept local IDs.",
  //   "Check in and Check out time is flexible. You can check in at any time and check out at any time.",
  //   "we accept pay at hotel. You can pay at hotel. We accept all types of cards and wallets.",
  //   "We provide free cancellation. You can cancel your booking at any time as per the hotel guidelines.",
  // ];

  // dashboard.dart
  static const String sureExit = "${AppStrings.areUSure}, you want to exit?";
  static const String home = "Home";
  static const String favourites = "Favourites";
  static const String bookings = "Bookings";
  static const String profile = "Profile";
  // onboarding.dart
  // splash_view.dart

  static const String skip = "Skip";
  // hotel_search_screen.dart
  static const String searchHotelTitle = "Search Hotel";
  static const String searchVillaTitle = "Search Villa";

  static const String resultHotel = " Hotel Founds";
  static const String resultVilla = "Villa Founds";
  static const String resultTours = " Tours Founds";
  static const String selectDates = 'Select in-out dates';
  // city_and_localities_list.dart
  static const String searchCityLocality = "Search city or locality";
  // hotel_search_screen.dart
  static const String whereQ = "Where?";
  static const String whenQ = "When?";
  static const String selectDate = "Select Date";
  static const String arrivalTimeQ = "Time of Arrival?";
  static const String selectTime = "Select Time";
  static const String selectGuestRoom = "Select Guests and Rooms";
  static const String checkIn = "Check-In";
  static const String checkOut = "Check-Out";
  static const String hourly = "Hourly";
  static const String regular = "Regular";
  static const String dateFormat = "MMMM d, EEE";
  static const String searchHourly = "Search Hourly Hotels";
  static const String searchHotels = "Search Hotels";
  static const String doneGuest = "DONE";

  static const String oopsE = "Oops!";
  static const String missingCheckInDate = "Please select a check-in date.";
  static const String missingCheckInTime = "Please select a check-in time.";
  static const String missingCheckOutDate = "Please select check-out date.";
}
