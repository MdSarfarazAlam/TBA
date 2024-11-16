// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:seeyusoon/services/content.service.dart';
// import 'package:seeyusoon/utils/keys.dart';
// import 'package:url_launcher/url_launcher.dart';

// class BookingNeedHelp extends StatelessWidget {
//   final String phone;
//   const BookingNeedHelp({Key? key, required this.phone}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Need Help?',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           ListTile(
//             dense: true,
//             leading: const Icon(Icons.phone_android),
//             title: const Text(
//               'Connect with SeeYuSoon',
//               style: TextStyle(fontSize: 16),
//             ),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () async {
//               String sysPhone = ContentServices.phone.isNotEmpty
//                   ? ContentServices.phone
//                   : (await Provider.of<ContentServices>(context, listen: false)
//                       .getContent(Keys.phone));
//               Uri uri = Uri(scheme: 'tel', path: sysPhone);
//               canLaunchUrl(uri).then((value) {
//                 if (value) {
//                   launchUrl(uri);
//                 } else {
//                   log(uri.toString());
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('Could not launch url'),
//                   ));
//                 }
//               });
//             },
//           ),
//           ListTile(
//             dense: true,
//             leading: const Icon(Icons.phone),
//             title: const Text(
//               'Call Hotel helpdesk',
//               style: TextStyle(fontSize: 16),
//             ),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () {
//               Uri uri = Uri(scheme: 'tel', path: phone);
//               canLaunchUrl(uri).then((value) {
//                 if (value) {
//                   launchUrl(uri);
//                 } else {
//                   log(uri.toString());
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('Could not launch url'),
//                   ));
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
