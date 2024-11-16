class Booking {
  int adults;
  int children;
  int rooms;
  String checkIn;
  String? checkOut;
  String? cityName;
  String? locationFullName;
  String? countryCode;
  String? cityCode;

  Booking(
      {this.adults = 2,
      this.children = 0,
      required this.checkIn,
      this.checkOut,
      this.rooms = 1,
      required this.cityName,
      this.locationFullName,
      this.countryCode,
      this.cityCode});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
        adults: json['adults'],
        children: json['children'],
        checkIn: json['checkIn'],
        checkOut: json['checkOut'],
        rooms: json['rooms'],
        cityName: json['cityName'],
        locationFullName: json['locationFullName'],
        countryCode: json['countryCode'],
        cityCode: json['cityCode']);
  }

  Map<String, dynamic> toJson() {
    return {
      'adults': adults,
      'children': children,
      'checkIn': checkIn,
      'checkOut': checkOut,
      'rooms': rooms,
      'cityName': cityName,
      'locationFullName': locationFullName,
      'countryCode': countryCode,
      'cityCode': cityCode
    };
  }

  factory Booking.empty(String check_in, String check_out) => Booking(
      checkIn: check_in,
      checkOut: check_out,
      adults: 2,
      children: 0,
      rooms: 1,
      cityName: '',
      locationFullName: "Search Location Here",
      countryCode: "",
      cityCode: "");

  @override
  String toString() {
    return 'Booking{ adults: $adults, children: $children, checkIn: $checkIn, checkOut: $checkOut,  rooms: $rooms, cityName: $cityName,locationFullName: $locationFullName,countryCode:$countryCode,cityCode:$cityCode}';
  }
}
