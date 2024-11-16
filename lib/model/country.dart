class Country {
  String code;
  String name;

  Country({required this.code, required this.name});

  factory Country.empty() => Country(code: '', name: '');

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'Country{code: $code, name: $name}';
  }
}
