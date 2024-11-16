class Locality {
  int count;
  String city;
  String state;
  String image;
  int minPrice;
  String name;

  Locality(
      {required this.count,
      required this.city,
      required this.state,
      required this.image,
      required this.minPrice,
      required this.name});

  factory Locality.empty() =>
      Locality(count: 0, city: '', state: '', image: '', minPrice: 0, name: '');

  factory Locality.fromJson(Map<String, dynamic> json) {
    return Locality(
      count: json['count'],
      city: json['city'],
      state: json['state'],
      image: json['image'],
      minPrice: json['minPrice'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'city': city,
      'state': state,
      'image': image,
      'minPrice': minPrice,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Locality(count: $count, city: $city, state: $state, image: $image, minPrice: $minPrice, name: $name)';
  }
}
