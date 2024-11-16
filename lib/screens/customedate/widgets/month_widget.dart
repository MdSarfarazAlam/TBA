import 'package:bta/screens/customedate/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthWidget extends StatelessWidget {
  final DateTime month;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Widget Function(BuildContext context, String month)? monthBuilder;

  const MonthWidget({
    super.key,
    required this.month,
    required this.locale,
    required this.layout,
    required this.monthBuilder,
    required this.textStyle,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final text =
        '${DateFormat('MMMM', locale).format(DateTime(month.year, month.month)).toUpperCase()} ${DateFormat('yyyy', locale).format(DateTime(month.year, month.month))}';

    if (monthBuilder != null) {
      return monthBuilder!(context, text);
    }

    return <Layout, Widget Function()>{
      Layout.DEFAULT: () => _pattern(context, text),
      Layout.BEAUTY: () => _beauty(context, text)
    }[layout]!();
  }

  Widget _pattern(BuildContext context, String text) {
    return Text(
      text.toUpperCase(),
      textAlign: textAlign ?? TextAlign.center,
      // style: textStyle ?? Theme.of(context).textTheme.headline6!,
    );
  }

  Widget _beauty(BuildContext context, String text) {
    return Text(
      text.toUpperCase(),
      textAlign: textAlign ?? TextAlign.center,
      style: textStyle ?? Theme.of(context).textTheme.labelLarge,
    );
  }
}
