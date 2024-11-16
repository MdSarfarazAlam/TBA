// import 'package:bta/utils/colors.dart';
// import 'package:bta/utils/strings.dart';
// import 'package:bta/widgets/auth/ring_screen.dart';
// import 'package:bta/widgets/my_text_field.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/my_button.dart';
// import 'login.dart';

// class SignUpScreen extends StatefulWidget {
//   final String? number;
//   const SignUpScreen({
//     super.key,
//     this.number,
//   });

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
// //  final User newUser = User.empty();
//   bool hidePass = false;

//   @override
//   void initState() {
//     // if (UserServices.currentUser != null) {
//     //   Navigator.of(context).pushAndRemoveUntil(
//     //       MaterialPageRoute(builder: (context) => const DashboardScreen()),
//     //       (route) => false);
//     // }
//     // super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RingScreen(children: [
//       const Text(
//         "Sign Up",
//         style: TextStyle(
//           fontSize: 36,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(
//         height: 30,
//       ),
//       Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             MyTextFormField(
//               floatingText: "Full name",
//               label: "Your full name",
//               validator: (String? value) {
//                 if (value!.isEmpty || !value.contains(" ")) {
//                   return "Please enter your full name";
//                 }
//                 return null;
//               },
//               onSaved: (String? value) {
//                 // newUser.firstName = value!.split(" ")[0];
//                 // newUser.lastName = value.split(" ")[1];
//               },
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             MyTextFormField(
//               floatingText: "Email",
//               label: "Your email address",
//               validator: (String? value) {
//                 if (value!.isEmpty) {
//                   return "Please enter your email";
//                 }
//                 if (!value.contains("@") || !value.contains(".")) {
//                   return "Please enter a valid email";
//                 }
//                 return null;
//               },
//               onSaved: (String? value) {
//                 ////// newUser.email = value!;
//               },
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             MyTextFormField(
//               floatingText: "Phone",
//               initialValue: widget.number,
//               label: "Your phone number",
//               validator: (String? value) {
//                 if (value!.isEmpty) {
//                   return "Please enter your phone number";
//                 }
//                 if (value.length < 10 || value.length > 13) {
//                   return "Please enter a valid phone";
//                 }
//                 return null;
//               },
//               onSaved: (String? value) {
//                 // newUser.phone = value!;
//               },
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 32,
//       ),
//       Center(
//         child: MyButton(
//           borderRadius: 10.0,
//           textColor: Colors.white,
//           color: AppColors.logoBlue,
//           title: AppStrings.signUp,
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               _formKey.currentState!.save();
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (context) => OTPScreen(
//               //               number: newUser.phone,
//               //               newUser: newUser,
//               //             )));
//             }
//           },
//         ),
//       ),
//       const SizedBox(
//         height: 24,
//       ),
//       Center(
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => const LoginScreen()),
//                 (Route<dynamic> route) => false);
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             child: RichText(
//               text: const TextSpan(
//                 text: "${AppStrings.haveAccountQ} ",
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: AppStrings.login,
//                     style: TextStyle(
//                       color: AppColors.primary,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
