// class User {
//   String firstName;
//   String lastName;
//   String email;
//   String phone;
//   DateTime createdAt;

//   String get fullname => '$firstName $lastName';

//   User({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.createdAt,
//   });

//   factory User.empty() => User(
//         firstName: '',
//         lastName: '',
//         email: '',
//         phone: '',
//         createdAt: DateTime.now(),
//       );

//   User.fromJson(Map<String, dynamic> json)
//       : firstName = json['firstName'],
//         lastName = json['lastName'],
//         email = json['email'],
//         phone = json['phone'],
//         createdAt = json['createdAt'] is Timestamp
//             ? (json['createdAt'] as Timestamp).toDate()
//             : DateTime.parse(json['createdAt']);

//   Map<String, dynamic> toJson() => {
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//         'phone': phone,
//         'createdAt': createdAt,
//       };

//   Map<String, String> toFlatJson() => {
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//         'phone': phone,
//         'createdAt': createdAt.toIso8601String(),
//       };

//   @override
//   String toString() {
//     return 'User{firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, createdAt: $createdAt}';
//   }
// }
