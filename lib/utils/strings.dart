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
  static const String toursLink =
      "https://www.projectexpedition.com/?utm_source=boutiquetransformativeadventures-14249-angie-28225&utm_medium=referral&utm_campaign=tagent";

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
  static const String splashView =
      "By 7days Traventure (OPC) Private Limited incorporated in Maharashtra and Accreditation by IATA TIDS  (Travel Industry Designator Service).";
  static const String letsBegin = "Let's begin";
  // relax_view.dart
  static const String relaxView =
      "Choose From a Wide Range of Properties Which SeeYuSoon Offers. Search Now! Book your Hotel in India online. Save up to 70% on your hourly hotels.";
  // care_view.dart
  static const String care = "Business Travellers";
  static const String careView =
      "Hourly Hotel / Micro stays are also of interest to business travellers who may need a place to work, to freshen up between meetings or to catch up on sleep when jet-lagged.";
  // mood_diary_view.dart
  static const String enjoyment = "Couple Friendly";
  static const String moodDiaryText =
      "Couple friendly hotels that accept local IDs, offer same day check-ins, ensure utmost privacy & more at affordable prices.";
  static const String welcome = "Welcome";
  static const String welcomeView =
      "Stay organised and live stress-free Stay organised and live stress-free";
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

  // hotel_result_screen.dart
  static const String sort = "Sort";
  static const String filter = "Filter";

  // covid_screen.dart
  static const String covid19Safety = "Covid-19  Safety Measures and Policies";

  static const List<FAQ> faqs = [
    FAQ(
        question: "Why should we book rooms with SEEYUSOON?",
        answer:
            "SEEYUSOON services are a must to avail for everyone out there looking for hotels because - We are not just any online hotel booking site but We have couple friendly rooms available with us on the hourly basis. You can stay as much as according to your work. It's not mandatroy to make more than 24hr booking for small period of time. We offer regular/hourly booking at best price in the market as per your requirements. We make sure that you are only paying for the duration you are staying with us. We do not even discriminate against local and unmarried people to book hotels with us."),
    FAQ(
        question:
            "I have a booking but unfortunately check-in date is not correct, as I have choosed in-correct date by mistake, can you help?",
        answer:
            "Yes, you can call to our customer support number +918087198279, they will contact to hotel for booking as per your requirement, or you can cancel you booking and book again."),
    FAQ(
        question:
            "I have booked hotel on your site www.seeyusoon.com but I have not received the confirmation mail, what should I do ?",
        answer:
            "Yes, you can call to our customer support number +918087198279, They will tell you everything about your bookings."),
    FAQ(
        question: "I want to know do you offer Package Tours?",
        answer:
            '''Yes, We offer package tours domestic and international. You can get on our website (https://www.7daystraventure.com/) and choose the wide Varity of packages we offer, if you need any further assistance please do reach out to  customercare@7daystraventure.com ,+91 8087 1982 79 / +91 9763 9174 31'''),
    FAQ(
        question:
            "I want to make a booking but unfortunately my card is not working, Can you Help?",
        answer:
            "Yes, if you have problems with your credit card, we accept offline payments / wallets /UPI as well."),
    FAQ(
        question:
            "I had make a regular booking on your site, but unfortunately as I got some personal issue, I had to cancel my travel, can I get refund.",
        answer:
            "Sorry to know about this, Yes you will get a 100% refund if you cancel 24hr prior of that booking in case of regular booking."),
    FAQ(
        question:
            "Can couple/people with local id book hotel rooms with seeyusoon??",
        answer:
            "Yes for sure. People with local ids are welcomed in most of our partnered hotels. You need to look for Local ID Accepted tag on hotel allowing couples on local ID."),
    FAQ(
        question: "Can pre booking any of the  Hotels to save cost ?",
        answer:
            "Hmm..!! Yes advance booking would help you to save cost to some extent, but it depends on the season you book. "),
  ];
}
