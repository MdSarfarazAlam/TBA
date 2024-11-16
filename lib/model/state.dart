class StateModel {
  int count;
  String name;
  String code;
  String image;

  StateModel(
      {required this.count,
      required this.name,
      required this.code,
      required this.image});

  factory StateModel.empty() =>
      StateModel(count: 0, name: '', code: '', image: '');

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      count: json['count'] ?? 0,
      name: json['name'],
      code: json['code'],
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'name': name,
      'code': code,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'State(count: $count, name: $name, code: $code, image: $image)';
  }
}
