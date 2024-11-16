// import 'dart:developer';

// import 'package:bta/model/user.dart';
// import 'package:bta/screens/home/homeScreen.dart';
// import 'package:bta/services/user.service.dart';
// import 'package:bta/utils/colors.dart';
// import 'package:bta/utils/strings.dart';
// import 'package:bta/widgets/auth/ring_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// const inputDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: 16.0),
// );

// bool resend = false;
// bool otpFilled = false;
// String filledOTP = "";

// class OTPScreen extends StatefulWidget {
//   final String number;
//   final User? newUser;
//   const OTPScreen({
//     super.key,
//     required this.number,
//     this.newUser,
//   });

//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<UserServices>(context, listen: false).sendOTP(widget.number);
//     filledOTP = "";
//   }

//   Future<bool> askForOut() async {
//     return await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text(AppStrings.areUSure),
//         content: const Text(AppStrings.changeNumberQ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: const Text(AppStrings.no),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: const Text(AppStrings.yes),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => // This dialog will exit your app on saying yes
//           (await askForOut()),
//       child: RingScreen(
//           backCallback: () async {
//             if (await askForOut()) {
//               Navigator.of(context).pop();
//             }
//           },
//           children: [
//             const Text(
//               AppStrings.verficationCode,
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             // const MyTextFormField(
//             //   floatingText:
//             //       "Please enter your email address to\nrequest a password reset.",
//             //   label: "Your email address",
//             // ),
//             const Text(
//               AppStrings.verficationCodeEnter,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             !otpFilled
//                 ? OTPFields(callback: (b) {
//                     setState(() {
//                       otpFilled = b;
//                     });
//                     if (!b) return;

//                     Provider.of<UserServices>(context, listen: false)
//                         .verifyOTP(filledOTP)
//                         .then((value) {
//                       if (value) {
//                         log(value.toString());
//                         if (widget.newUser != null) {
//                           Provider.of<UserServices>(context, listen: false)
//                               .createUser(widget.newUser!)
//                               .then((_) {
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomeScreen()));
//                           });
//                         } else {
//                           Provider.of<UserServices>(context, listen: false)
//                               .login(widget.number)
//                               .then((_) {
//                             Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomeScreen()),
//                                 (route) => false);
//                           });
//                         }
//                       } else {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: const Text("Error"),
//                                 content: const Text("Invalid OTP"),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: const Text("OK"))
//                                 ],
//                               );
//                             });
//                         setState(() {
//                           otpFilled = false;
//                         });
//                       }
//                     });
//                   })
//                 : const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//             const SizedBox(
//               height: 32,
//             ),
//             Center(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (context) => OTPScreen(
//                           number: widget.number, newUser: widget.newUser)));
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   child: RichText(
//                     text: TextSpan(
//                       text: "${AppStrings.noCode} ",
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: AppStrings.resend,
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//     );
//   }
// }

// class OTPFields extends StatefulWidget {
//   const OTPFields({
//     super.key,
//     required this.callback,
//   });
//   final Function callback;

//   @override
//   State<OTPFields> createState() => _OTPFieldsState();
// }

// class _OTPFieldsState extends State<OTPFields> {
//   final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
//   FocusNode? pin1FN;
//   FocusNode? pin2FN;
//   FocusNode? pin3FN;
//   FocusNode? pin4FN;
//   TextStyle pinStyle =
//       const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
//   List<String> otp = List<String>.filled(4, ' ');

//   @override
//   void initState() {
//     super.initState();
//     pin1FN = FocusNode();
//     pin2FN = FocusNode();
//     pin3FN = FocusNode();
//     pin4FN = FocusNode();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pin1FN?.dispose();
//     pin2FN?.dispose();
//     pin3FN?.dispose();
//     pin4FN?.dispose();
//   }

//   void nextField(String value, FocusNode? focusNode) {
//     if (value.length == 1) {
//       focusNode!.children.first.requestFocus();
//     }
//   }

//   void eventCheck(RawKeyEvent event, FocusNode fn) {
//     if (event.logicalKey == LogicalKeyboardKey.backspace &&
//         event.runtimeType.toString() == "RawKeyDownEvent") {
//       // here you can check if textfield is focused
//       // dev.log('backspace clicked');
//       fn.children.first.requestFocus();
//       widget.callback(false);
//     }
//   }

//   InputDecoration? inputDecoration;

//   @override
//   Widget build(BuildContext context) {
//     inputDecoration = InputDecoration(
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Color(0xFFDDDDDD), width: 1),
//       ),
//       fillColor: Colors.transparent,
//       filled: true,
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: AppColors.primary, width: 1),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: AppColors.primary, width: 1),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.white12, width: 1),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: AppColors.primary, width: 1),
//       ),
//       contentPadding: const EdgeInsets.all(12),
//     );
//     return Form(
//       key: _fKey,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: 64,
//                 child: RawKeyboardListener(
//                   onKey: (event) => eventCheck(event, pin1FN!),
//                   focusNode: pin1FN!,
//                   child: TextFormField(
//                     autofocus: true,
//                     style: pinStyle.copyWith(
//                         color: Theme.of(context).colorScheme.primary),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: inputDecoration,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(1),
//                     ],
//                     onChanged: (value) {
//                       nextField(value, pin2FN);
//                     },
//                     onSaved: (newValue) => otp[0] = newValue!,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 64,
//                 child: RawKeyboardListener(
//                   focusNode: pin2FN!,
//                   onKey: (event) => eventCheck(event, pin1FN!),
//                   child: TextFormField(
//                     // focusNode: ,
//                     style: pinStyle.copyWith(
//                         color: Theme.of(context).colorScheme.primary),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: inputDecoration,

//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(1),
//                     ],
//                     onSaved: (newValue) => otp[1] = newValue!,
//                     onChanged: (value) => nextField(value, pin3FN),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 64,
//                 child: RawKeyboardListener(
//                   focusNode: pin3FN!,
//                   onKey: (event) => eventCheck(event, pin2FN!),
//                   child: TextFormField(
//                     // focusNode: pin3FN,
//                     style: pinStyle.copyWith(
//                         color: Theme.of(context).colorScheme.primary),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: inputDecoration,

//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(1),
//                     ],
//                     onSaved: (newValue) => otp[2] = newValue!,
//                     onChanged: (value) => nextField(value, pin4FN),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 64,
//                 child: RawKeyboardListener(
//                   focusNode: pin4FN!,
//                   onKey: (event) => eventCheck(event, pin3FN!),
//                   child: TextFormField(
//                     style: pinStyle.copyWith(
//                         color: Theme.of(context).colorScheme.primary),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: inputDecoration,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(1),
//                     ],
//                     onSaved: (newValue) => otp[3] = newValue!,
//                     onChanged: (value) {
//                       if (value.length == 1) {
//                         pin4FN!.unfocus();
//                         _fKey.currentState!.save();
//                         filledOTP = otp.join("");
//                         log(filledOTP);
//                         widget.callback(true);
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
