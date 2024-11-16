class City {
  int count;
  String name;
  String state;

  City({required this.count, required this.name, required this.state});

  factory City.empty() {
    return City(count: 0, name: '', state: '');
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(count: json['count'], name: json['name'], state: json['state']);
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'name': name,
      'state': state,
    };
  }

  @override
  String toString() {
    return 'City(count: $count, name: $name, state: $state)';
  }
}
