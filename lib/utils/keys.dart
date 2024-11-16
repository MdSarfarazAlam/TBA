class Keys {
  //////// services ////////////////
  // hotel.service.dart
  static const String hotels = 'hotels';
  // user.service.dart
  static const String customers = 'customers';
  // content.service.dart
  static const String contents = 'contents';
  static const String content = 'content';
  static const String hotelPolicy = 'hotelPolicy';
  static const String covidSafety = 'covidSafety';
  static const String cancellationPolicy = 'cancellationPolicy';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String aboutUs = 'aboutUs';
  static const String address = 'address';
  static const String addressEmbed = 'addressEmbed';
  static const String facebook = 'facebook';
  static const String instagram = 'instagram';
  static const String linkedin = 'linkedin';
  static const String privacyPolicy = 'privacyPolicy';
  static const String termsOfUse = 'termsOfUse';
  static const String twitter = 'twitter';
  // location.service.dart
  static const String localities = 'localities';
  static const String cities = 'cities';
  static const String states = 'states';
  // booking.service.dart
  static const String bookings = 'bookings';
  // request.service.dart
  static const String requests = 'requests';

  // razor_pay.dart
  // static const String razorPayKeyID = 'rzp_test_rsDjALq1ByCH2F';
  static const String razorPayKeyID = 'rzp_live_sxaAHucZdZl0S6';
  // static const String razorPayKeySecret = 'e7ODjgtuBZAe95Sio4qHdMSr';
  static const String razorPayKeySecret = 'MEY6lx8FWX2ZOBslXZxBNkvj';
  static const String baseURL = 'https://seeyusoon.com/';
  static const String orderAPI = '${baseURL}services/pay.php';
  static const String verifyAPI = '${baseURL}services/verify.php';
  static const String orders = 'orders';

  // profile.dart
  static const String playStore =
      "https://play.google.com/store/apps/details?id=com.seeyusoon.seeyusoon";
  static const String appStore = 'https://apps.apple.com/us/app/';

  // price_toggle.dart
  static List<int> hours = [3, 6, 12];
}
