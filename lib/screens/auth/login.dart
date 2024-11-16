// import 'package:bta/screens/auth/otp.dart';
// import 'package:bta/screens/auth/signup.dart';
// import 'package:bta/services/user.service.dart';
// import 'package:bta/utils/colors.dart';
// import 'package:bta/utils/strings.dart';
// import 'package:bta/widgets/auth/ring_screen.dart';
// import 'package:bta/widgets/my_button.dart';
// import 'package:bta/widgets/my_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String phoneNumber = '';
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     // if (UserServices.currentUser != null) {
//     //   Navigator.of(context).pushAndRemoveUntil(
//     //       MaterialPageRoute(builder: (context) => const DashboardScreen()),
//     //       (route) => false);
//     // }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RingScreen(children: [
//       const Text(
//         AppStrings.login,
//         style: TextStyle(
//           fontSize: 36,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(
//         height: 30,
//       ),
//       RichText(
//         text: const TextSpan(
//           style: TextStyle(
//             fontSize: 12.0,
//             color: Colors.black54,
//           ),
//           children: <TextSpan>[
//             TextSpan(text: "${AppStrings.otpPrefix} "),
//             TextSpan(
//                 text: AppStrings.otp,
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             TextSpan(text: " ${AppStrings.otpSuffix}"),
//           ],
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
//               label: AppStrings.phoneNumber,
//               keyboardType: TextInputType.phone,
//               onSaved: (String? value) {
//                 phoneNumber = value!;
//               },
//               validator: (String? value) {
//                 if (value!.isEmpty) {
//                   return AppStrings.phoneNumberRequired;
//                 }
//                 if (value.length < 10 || value.length > 13) {
//                   return AppStrings.phoneNumberInvalid;
//                 }
//                 return null;
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
//           color: const Color(0xFF161745),
//           title: isLoading ? AppStrings.loading : AppStrings.verify,
//           onPressed: !isLoading
//               ? () async {
//                   isLoading = true;
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     if ((await Provider.of<UserServices>(context, listen: false)
//                             .getUser(phoneNumber)) !=
//                         null) {
//                       setState(() {
//                         isLoading = false;
//                       });
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(
//                               builder: (context) =>
//                                   OTPScreen(number: phoneNumber)))
//                           .then((value) {
//                         if (value != null && value == true) {
//                           setState(() {
//                             isLoading = false;
//                           });
//                         }
//                       });
//                     } else {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               SignUpScreen(number: phoneNumber)));
//                     }
//                   }
//                 }
//               : null,
//         ),
//       ),
//       const SizedBox(
//         height: 24,
//       ),
//       Center(
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => const SignUpScreen()));
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             child: RichText(
//               text: const TextSpan(
//                 text: "${AppStrings.dontHaveAccount} ",
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: AppStrings.signUp,
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
//       const Spacer(),
//       Center(
//         child: Column(
//           children: [
//             InkWell(
//               // onTap: () {
//               //   Navigator.of(context).push(MaterialPageRoute(
//               //       builder: (context) => const OwnerLoginScreen()));
//               // },
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 child: RichText(
//                   text: const TextSpan(
//                     text: "Login with finger print? ",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: "Login here",
//                         style: TextStyle(
//                           color: AppColors.primary,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               // onTap: () {
//               //   Navigator.of(context).push(MaterialPageRoute(
//               //       builder: (context) => const ListYourHotel()));
//               // },
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 child: RichText(
//                   text: const TextSpan(
//                     text: "Or want to ",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: "Login with Face ID?",
//                         style: TextStyle(
//                           color: AppColors.primary,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
// }
