import 'package:bta/model/city.dart';
import 'package:bta/model/country.dart';
import 'package:bta/model/locality.dart';
import 'package:bta/model/state.dart';

class Address {
  String address;
  City city;
  Country country;
  double lat;
  double lng;
  List<Locality> localities;
  String pincode;
  StateModel state;
  String url;

  Address(
      {required this.address,
      required this.city,
      required this.country,
      required this.lat,
      required this.lng,
      required this.localities,
      required this.pincode,
      required this.state,
      required this.url});

  factory Address.empty() => Address(
      address: '',
      city: City.empty(),
      country: Country.empty(),
      lat: 0,
      lng: 0,
      localities: [],
      pincode: '',
      state: StateModel.empty(),
      url: '');

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'],
      city: json['city'] is String
          ? City(name: json['city'], count: 0, state: '')
          : City.fromJson(json['city']),
      country: json['country'] is String
          ? Country(name: json['country'], code: '')
          : Country.fromJson(json['country']),
      lat: json['lat'],
      lng: json['lng'],
      localities: json['locality'] is List && json['locality'].length > 0
          ? List<Locality>.from(json['locality'].map((x) => Locality(
              name: x, count: 0, state: '', city: '', image: '', minPrice: 0)))
          : json['locality'] is String && json['locality'].isNotEmpty
              ? [
                  Locality(
                      name: json['locality'],
                      count: 0,
                      state: '',
                      city: '',
                      image: '',
                      minPrice: 0)
                ]
              : json['locality'] is Map && json['locality'].length > 0
                  ? List<Locality>.from(json['locality'].map((x) => Locality(
                      name: x,
                      count: 0,
                      state: '',
                      city: '',
                      image: '',
                      minPrice: 0)))
                  : [],
      // locality: json['locality'] is String
      //     ? Locality(
      //         name: json['locality'],
      //         count: 0,
      //         state: '',
      //         city: '',
      //         image: '',
      //         minPrice: 0)
      //     : Locality.fromJson(json['locality']),
      pincode: json['pincode'],
      state: json['state'] is String
          ? StateModel(name: json['state'], count: 0, code: '', image: '')
          : StateModel.fromJson(json['state']),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city.toJson(),
      'country': country.toJson(),
      'lat': lat,
      'lng': lng,
      'localities': localities,
      'pincode': pincode,
      'state': state.toJson(),
      'url': url,
    };
  }

  @override
  String toString() {
    return 'Address(address: $address, city: $city, country: $country, lat: $lat, lng: $lng, localities: $localities, pincode: $pincode, state: $state, url: $url)';
  }
}
