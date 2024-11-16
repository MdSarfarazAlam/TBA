import 'dart:developer';

import 'package:bta/screens/customedate/controllers/clean_calendar_controller.dart';
import 'package:bta/screens/customedate/scrollable_clean_calendar.dart';
import 'package:bta/screens/customedate/utils/enums.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:bta/utils/strings.dart';
import 'package:bta/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class CustomeDateScreen extends StatefulWidget {
  final isRangeMode, type;
  const CustomeDateScreen({super.key, this.isRangeMode, this.type});
  @override
  _CustomeDateScreenState createState() => _CustomeDateScreenState();
}

class _CustomeDateScreenState extends State<CustomeDateScreen> {
  List<String> weekName = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  List<dynamic> rangeDateTapped = [];
  CleanCalendarController calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      setControllerForDate();
    });
  }

  setControllerForDate() {
    calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      initialDateSelected: widget.isRangeMode
          ? context.read<ModuleName>().departureStandardDate
          : context.read<ModuleName>().departureStandardDate,
      endDateSelected: widget.isRangeMode
          ? context.read<ModuleName>().returnStandardDate
          : context.read<ModuleName>().departureStandardDate,
      onRangeSelected: (firstDate, secondDate) {
        log('firstDate=======$firstDate');
        log('secondDate=======$secondDate');

        context.read<ModuleName>().setdepartureStandardDate(dateX: firstDate);
        if (secondDate != null) {
          context.read<ModuleName>().setreturnStandardDate(dateX: secondDate);
        } else {
          context.read<ModuleName>().setreturnStandardDate(dateX: firstDate);
        }
        context.read<ModuleName>().setdepartureSelectedDateFormatted(
            departureDateX: context
                .read<ModuleName>()
                .convertStandardDateToFormattedDate(dateX: firstDate));
        context.read<ModuleName>().setreturnSelectedDateFormatted(
            returnDateX: secondDate != null
                ? context
                    .read<ModuleName>()
                    .convertStandardDateToFormattedDate(dateX: secondDate)
                : '--');
      },
      onDayTapped: (date) {
        log('dayTapped=======$date');
      },
      rangeMode: widget.isRangeMode,
      onPreviousMinDateTapped: (date) {},
      onAfterMaxDateTapped: (date) {
        log('onAfterMaxDateTapped=======$date');
      },
      weekdayStart: DateTime.monday,
      // initialDateSelected: DateTime(2022, 2, 3),
      // endDateSelected: DateTime(2022, 2, 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(AppStrings.selectDates,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        actions: [
          IconButton(
            onPressed: () {
              calendarController.clearSelectedDates();
            },
            icon: const Icon(Icons.clear),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              height: SizeConfig.blockSizeVertical * 6,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black45, width: .2),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: weekName
                        .map((item) => Text(
                              item,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: ScrollableCleanCalendar(
              dayBackgroundColor: Colors.white,
              calendarMainAxisSpacing: 0,
              padding: const EdgeInsets.all(0),
              monthBuilder: (ctx, monthName) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    monthName.characters.toString(),
                  ),
                );
              },
              showWeekdays: false,
              spaceBetweenCalendars: 0,
              spaceBetweenMonthAndCalendar: 0,
              daySelectedBackgroundColorBetween:
                  AppColors.logoBlue.withOpacity(.3),
              // dayDisableBackgroundColor: Colors.red,
              daySelectedBackgroundColor: AppColors.logoBlue,
              dayTextStyle: const TextStyle(
                  fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
              calendarController: calendarController,
              layout: Layout.BEAUTY,
              calendarCrossAxisSpacing: 0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: SizeConfig.blockSizeVertical * 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: widget.isRangeMode
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.s,
                    children: [
                      returnDateSelectedBox(
                          selectedDateX:
                              context.watch<ModuleName>().departureDate,
                          colorx: AppColors.logoBlue.withOpacity(.8),
                          text: 'CHECK-IN',
                          paddingx: const EdgeInsets.only(
                              left: 4, right: 6, top: 4, bottom: 6),
                          box: 0),
                      widget.isRangeMode
                          ? returnDateSelectedBox(
                              selectedDateX: widget.isRangeMode
                                  ? context.watch<ModuleName>().returnDate ??
                                      '--'
                                  : 'save more on round trips!',
                              colorx: Colors.grey.shade400,
                              text: widget.type == 'HotelCalender'
                                  ? 'CHECK-OUT'
                                  : 'RETURN DATE',
                              paddingx: const EdgeInsets.only(
                                  left: 16, right: 0, top: 4, bottom: 6),
                              box: 1)
                          : const SizedBox(
                              width: 0,
                            ),
                    ],
                  ),
                  widget.isRangeMode
                      ? Positioned(
                          top: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeHorizontal * 36,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 3.5,
                            width: SizeConfig.blockSizeHorizontal * 16,
                            decoration: BoxDecoration(
                                color: AppColors.logoBlue,
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                  context
                                              .read<ModuleName>()
                                              .returnStandardDate!
                                              .difference(context
                                                  .read<ModuleName>()
                                                  .departureStandardDate!)
                                              .inDays ==
                                          0
                                      ? "Same Day"
                                      : '${context.read<ModuleName>().returnStandardDate!.difference(context.read<ModuleName>().departureStandardDate!).inDays} Days',
                                  style:
                                      const TextStyle(color: AppColors.white)),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              MyButton(
                  size: Size(SizeConfig.blockSizeHorizontal * 100, 55),
                  borderRadius: 10.0,
                  textColor: Colors.white,
                  color: AppColors.primary,
                  title: "DONE",
                  onPressed: onPressedFunction),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedFunction() async {
    if (widget.isRangeMode) {
      if (context.read<ModuleName>().returnDate == '--') {
        if (widget.type == 'HotelCalender') {
          Fluttertoast.showToast(msg: 'Please Select CHECK-OUT Date');
        } else {
          Fluttertoast.showToast(msg: 'Please Select Return Date');
        }
      } else {
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
    }
  }

  Widget returnDateSelectedBox(
      {String? selectedDateX,
      Color? colorx,
      String? text,
      EdgeInsetsGeometry? paddingx,
      int? box}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 8,
      width: SizeConfig.blockSizeHorizontal * 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: colorx!)),
      child: Padding(
        padding: paddingx!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizeConfig.screenWidth > 320
                ? SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  )
                : SizedBox(
                    height: SizeConfig.blockSizeVertical * .2,
                  ),
            Text(text!,
                style: TextStyle(
                  fontSize: 14,
                  color: colorx,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 3,
            ),
            Flexible(
              child: Text(
                selectedDateX!,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.isRangeMode == false && box == 0 ||
                          widget.isRangeMode == true && box == 1 ||
                          widget.isRangeMode == true && box == 0
                      ? Colors.black
                      : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
