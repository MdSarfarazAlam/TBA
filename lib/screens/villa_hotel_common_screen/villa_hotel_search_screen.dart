// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:bta/model/booking.dart';
import 'package:bta/screens/customedate/CustomeDateScreen.dart';
import 'package:bta/screens/hotel/hotelLocationSearchScreeen.dart';
import 'package:bta/screens/hotel/hotel_result_screen.dart';
import 'package:bta/screens/hotel/hotel_room_select_screen.dart';
import 'package:bta/screens/villa/villa_result_screen.dart';

import 'package:bta/services/content.service.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/keys.dart';

import 'package:bta/utils/strings.dart';
import 'package:bta/widgets/my_button.dart';
import 'package:bta/widgets/row_icon_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

class VillaHotelSearchScreen extends StatefulWidget {
  final isHotel;
  const VillaHotelSearchScreen({super.key, required this.isHotel});

  @override
  State<VillaHotelSearchScreen> createState() => _VillaHotelSearchScreenState();
}

class _VillaHotelSearchScreenState extends State<VillaHotelSearchScreen>
    with SingleTickerProviderStateMixin {
  List<bool> bookingType = [true, false];

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerRooms = TextEditingController();
  late final Function(String)? textChangedRef = null;
  var currentTabIndex = 0;

  String adultParam = '';
  String childParam = '';
  String childAgeParam = '';
  late Booking booking;
  @override
  void initState() {
    super.initState();

    booking = Provider.of<Booking>(context, listen: false);
    _controller.text = booking.locationFullName!;

    if (booking.children > 0) {
      _controllerRooms.text =
          "${booking.rooms} Room, ${booking.adults} Adult, ${booking.children} Children";
    } else {
      _controllerRooms.text = "${booking.rooms} Room, ${booking.adults} Adult";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.isHotel
                ? AppStrings.searchHotelTitle
                : AppStrings.searchVillaTitle,
            style: const TextStyle(
                color: AppColors.white, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          elevation: 0,
          actions: const []),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Stack(
          children: [
            Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      AppStrings.appName,
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const RowIconText(
                      gap: 5.0,
                      icon: Icons.search,
                      text: AppStrings.whereQ,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: AppColors.primary.withOpacity(0.2),
                      child: ListTile(
                        onTap: () async {
                          HapticFeedback.vibrate();

                          _controller.text = await Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const HotelSearchValue()));

                          setState(() {});
                          print("${_controller.text}=====================");
                        },
                        title: Text(
                          _controller.text,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                        trailing: const Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const RowIconText(
                      gap: 5.0,
                      icon: Icons.calendar_month_outlined,
                      text: "${AppStrings.checkIn} - ${AppStrings.checkOut}",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: AppColors.primary.withOpacity(0.2),
                      child: ListTile(
                        onTap: () async {
                          HapticFeedback.vibrate();

                          await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (route) => const CustomeDateScreen(
                                      isRangeMode: true,
                                      type: 'HotelCalender')));
                          setState(() {
                            print(context
                                .read<ModuleName>()
                                .departureDate!
                                .toString());
                            booking.checkIn =
                                context.read<ModuleName>().departureDate!;
                            booking.checkOut =
                                context.read<ModuleName>().returnDate!;
                          });
                        },
                        title: Text(
                          "${booking.checkIn} - ${booking.checkOut}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const RowIconText(
                      gap: 5.0,
                      icon: Icons.house,
                      text: AppStrings.selectGuestRoom,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: AppColors.primary.withOpacity(0.2),
                      child: ListTile(
                        onTap: () async {
                          HapticFeedback.vibrate();

                          List totalHotelRoomData = await Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const HotelRoomsSelect()));

                          if (totalHotelRoomData != null) {
                            booking.adults = 0;
                            booking.children = 0;
                            setState(() {
                              adultParam = '';
                              childParam = '';
                              childAgeParam = '';
                              booking.rooms = int.parse(totalHotelRoomData[0]);
                            });

                            var totalRoom = totalHotelRoomData[0] + ' Room, ';

                            int i = 0;
                            while (i < int.parse(totalHotelRoomData[0])) {
                              if (i != 0) {
                                childAgeParam += '-';
                              }
                              if (i != 0) {
                                adultParam += ',';
                                childParam += ',';
                              }
                              booking.adults +=
                                  int.parse(totalHotelRoomData[1][i]);
                              adultParam += totalHotelRoomData[1][i];
                              booking.children +=
                                  int.parse(totalHotelRoomData[2][i]);
                              childParam += totalHotelRoomData[2][i];
                              int j = 0;
                              while (j < int.parse(totalHotelRoomData[2][i])) {
                                if (j != 0) {
                                  childAgeParam += ',';
                                } else {
                                  childAgeParam += '${i}_';
                                }

                                childAgeParam += totalHotelRoomData[3][i][j];
                                j++;
                              }
                              if (j == 0) {
                                childAgeParam += i.toString();
                              }

                              i++;
                            }

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setInt('total_room', booking.rooms);
                            prefs.setInt('total_adult', booking.adults);
                            prefs.setInt('total_child', booking.children);
                            prefs.setString('child_age_param', childAgeParam);

                            prefs.setString('adultParam', adultParam);
                            prefs.setString('childParam', childParam);

                            setState(() {
                              _controllerRooms.text = totalRoom +
                                  booking.adults.toString() +
                                  ' Adult';
                              if (booking.children != 0) {
                                _controllerRooms.text +=
                                    ', ${booking.children} Children';
                              }
                            });
                          }
                        },
                        title: Text(
                          _controllerRooms.text.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyButton(
          borderRadius: 15.0,
          textColor: AppColors.white,
          color: AppColors.primary,
          onPressed: () async {
            if (booking.checkOut == null) {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        title: Text(AppStrings.oopsE),
                        content: Text(AppStrings.missingCheckOutDate),
                      ));
              return;
            } else {
              if (widget.isHotel) {
                await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const HotelResultScreen()));
              } else {
                await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const VillaResultScreen()));
              }
            }
          },
          title: AppStrings.searchHotels,
        ),
      ),
    );
  }
}
