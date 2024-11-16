// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// extension DateTimeExtension on DateTime {
//   static int? _istToUtcDifference;

//   int _getISTtoUTCDifference() {
//     if (_istToUtcDifference == null) {
//       tz.initializeTimeZones();
//       final locationIN = tz.getLocation('Asia/Kolkata');
//       tz.TZDateTime nowNY = tz.TZDateTime.now(locationIN);
//       _istToUtcDifference = nowNY.timeZoneOffset.inMinutes;
//     }

//     return _istToUtcDifference!;
//   }

//   DateTime toISTzone() {
//     DateTime result = toUtc(); // local time to UTC
//     result = result
//         .add(Duration(minutes: _getISTtoUTCDifference())); // convert UTC to IST
//     return result;
//   }

//   DateTime fromISTzone() {
//     DateTime result = subtract(
//         Duration(minutes: _getISTtoUTCDifference())); // convert IST to UTC

//     String dateTimeAsIso8601String = result.toIso8601String();
//     dateTimeAsIso8601String +=
//         dateTimeAsIso8601String[dateTimeAsIso8601String.length - 1] == 'Z'
//             ? ''
//             : 'Z';
//     result = DateTime.parse(dateTimeAsIso8601String); // make isUtc to be true

//     result = result.toLocal(); // convert UTC to local time
//     return result;
//   }
// }
