import 'package:bta/model/city.dart';
import 'package:bta/model/locality.dart';
import 'package:bta/model/state.dart';

class Location {
  int count;
  String name;
  String? state;
  String? city;
  String? locality;
  String key;
  Type type;

  Location(
      {required this.count,
      required this.name,
      this.state,
      this.city,
      this.locality,
      required this.key,
      required this.type});

  factory Location.empty() {
    return Location(count: 0, name: '', key: '', type: Null);
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      count: json['count'],
      name: json['name'],
      state: json['state'],
      city: json['city'],
      locality: json['locality'],
      key: json['key'],
      type: json['type'],
    );
  }

  factory Location.fromCity(City city) {
    return Location(
      count: city.count,
      name: city.name,
      state: city.state,
      key: "address.city",
      type: City,
    );
  }

  factory Location.fromLocality(Locality locality) {
    return Location(
      count: locality.count,
      name: locality.name,
      state: locality.state,
      city: locality.city,
      key: "address.locality",
      type: Locality,
    );
  }

  factory Location.fromState(StateModel state) {
    return Location(
      count: state.count,
      name: state.name,
      key: "address.state.name",
      type: StateModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'name': name,
      'state': state,
      'city': city,
      'locality': locality,
      'key': key,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'Location(count: $count, name: $name, state: $state, city: $city, locality: $locality, key: $key, type: $type)';
  }
}
