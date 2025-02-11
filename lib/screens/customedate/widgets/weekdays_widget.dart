import 'package:bta/screens/customedate/utils/enums.dart';
import 'package:flutter/material.dart';

import '../controllers/clean_calendar_controller.dart';

class WeekdaysWidget extends StatelessWidget {
  final bool showWeekdays;
  final CleanCalendarController cleanCalendarController;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final Widget Function(BuildContext context, String weekday)? weekdayBuilder;

  const WeekdaysWidget({
    super.key,
    required this.showWeekdays,
    required this.cleanCalendarController,
    required this.locale,
    required this.layout,
    required this.weekdayBuilder,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (!showWeekdays) return const SizedBox.shrink();

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: List.generate(DateTime.daysPerWeek, (index) {
        final weekDay = cleanCalendarController.getDaysOfWeek(locale)[index];

        if (weekdayBuilder != null) {
          return weekdayBuilder!(context, weekDay);
        }

        return <Layout, Widget Function()>{
          Layout.DEFAULT: () => _pattern(context, weekDay),
          Layout.BEAUTY: () => _beauty(context, weekDay)
        }[layout]!();
      }),
    );
  }

  Widget _pattern(BuildContext context, String weekday) {
    return Center(
      child: Text(
        weekday.toUpperCase(),
        // style: textStyle ??
        //     Theme.of(context).textTheme.bodyText1!.copyWith(
        //           color: Theme.of(context)
        //               .textTheme
        //               .bodyText1!
        //               .color!
        //               .withOpacity(.4),
        //           fontWeight: FontWeight.bold,
        //         ),
      ),
    );
  }

  Widget _beauty(BuildContext context, String weekday) {
    return Center(
      child: Text(
        weekday.toUpperCase(),
        // style: textStyle ??
        //     Theme.of(context).textTheme.bodyText1!.copyWith(
        //           color: Theme.of(context)
        //               .textTheme
        //               .bodyText1!
        //               .color!
        //               .withOpacity(.4),
        //           fontWeight: FontWeight.bold,
        //         ),
      ),
    );
  }
}
