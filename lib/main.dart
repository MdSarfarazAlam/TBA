import 'package:bta/model/booking.dart';
import 'package:bta/screens/home/homeScreen.dart';
import 'package:bta/screens/splashscreen/splashscreen.dart';
import 'package:bta/services/local_storage.service.dart';
import 'package:bta/utils/ModuleName.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocalStorageService localStorageService = LocalStorageService();
  await localStorageService.init();
  String? departureDate = DateFormat('dd MMM EE,yyyy')
      .format(DateTime.now().add(const Duration(days: 2)));

  String? returnDate = DateFormat('dd MMM EE,yyyy')
      .format(DateTime.now().add(const Duration(days: 4)));
  Booking booking =
      Booking.empty(departureDate.split(",")[0], returnDate.split(",")[0]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ModuleName()),
    Provider(create: (_) => booking),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: const MaterialColor(0xFF9d8360, {
                50: Color(0xfff2f2f2),
                100: Color(0xffe6e6e6),
                200: Color(0xffcccccc),
                300: Color(0xffb3b3b3),
                400: Color(0xff999999),
                500: Color(0xff808080),
                600: Color(0xff666666),
                700: Color(0xff4d4d4d),
                800: Color(0xff333333),
                900: Color(0xff191919)
              }),
              primaryColor: AppColors.primary,
              // secondaryHeaderColor: AppColors.accent,
              fontFamily: "Product-Sans",
              // brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.primary,
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              tabBarTheme: const TabBarTheme(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                color: Colors.transparent,
              ))),
            ),
            home: const SplashScreen(),
          );
        });
      },
    );
  }
}
