import 'package:bta/screens/aiItinearyscreen/aiItinearyScreen.dart';
import 'package:bta/screens/hotel/hotelLocationSearchScreeen.dart';
import 'package:bta/screens/hotel/hotel_result_screen.dart';
import 'package:bta/screens/hotel/hotel_room_select_screen.dart';
import 'package:bta/screens/insurance/insuranceResultScreen.dart';
import 'package:bta/screens/tours/tourResultScreen.dart';
import 'package:bta/screens/villa/villa_result_screen.dart';
import 'package:bta/screens/villa_hotel_common_screen/villa_hotel_search_screen.dart';
import 'package:bta/utils/assets.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:bta/utils/strings.dart';
import 'package:bta/widgets/bottom_screens/home/Info_card.dart';
import 'package:bta/widgets/hotel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

final List rooms = [
  {"image": "assets/hotel/room1.jpg", "title": "Awesome room near Bouddha"},
  {"image": "assets/hotel/room2.jpg", "title": "Peaceful Room"},
  {"image": "assets/hotel/room3.jpg", "title": "Beautiful Room"},
  {
    "image": "assets/hotel/room4.jpg",
    "title": "Vintage room near Pashupatinath"
  },
];

class HomeScreen extends StatefulWidget {
  static const String path = "lib/src/pages/hotel/hhome.dart";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration
    );
    _animation = Tween<double>(begin: 0.1, end: 1)
        .animate(_controller); // Opacity values from 0.1 to 1.0

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: _buildCategories(),
          ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 20.0,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: aiItinearyBTN(
          //       AppStrings.manageBookingLink, AppStrings.manageBookingText),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),

          // SliverToBoxAdapter(child: _blogWebsite(context, 0, _animation)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          const SliverToBoxAdapter(child: VacationsPackages()),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.getAppLayoutRadius)),
                  gradient: const LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.logoGrey,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      tileMode: TileMode.clamp)),
            ),
          ),
        ],
      ),
    );
  }

  Widget aiItinearyBTN(String link, String text) {
    return Link(
      target: LinkTarget.self,
      uri: Uri.parse(link),
      builder: (BuildContext context, FollowLink? followLink) => Container(
        //   alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: SizedBox(
          width: SizeConfig.blockSizeHorizontal *
              70, // Specify the width you want here
          height: 50, // Specify the height you want here
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AIIinearyScreen(link: link, text: text)));
              // print("Doing everything");
            }, // This child can be everything. I want to choose a beautiful Text Widget
            style: ElevatedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // minimumSize:
              //     const Size(10, 40), //change size of this beautiful button
              // We can change style of this beautiful elevated button thanks to style prop
              backgroundColor: Colors.white, // we can set primary color
              foregroundColor: Colors.white, // change color of child prop
              // surfaceTintColor: AppColors.logoGrey, //surface color
              shadowColor: Colors
                  .grey, //shadow prop is a very nice prop for every button or card widgets.
              elevation: 5, // we can set elevation of this beautiful button
              side: const BorderSide(
                  color: AppColors.itemborderColor, //change border color
                  width: 1, //change border width
                  style: BorderStyle
                      .solid), // change border side of this beautiful button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), //change border radius of this beautiful button thanks to BorderRadius.circular function
              ),
              tapTargetSize: MaterialTapTargetSize.padded,
            ), //This prop for beautiful expressions
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: AppColors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Two items per row
          childAspectRatio: 1, // Square items
          crossAxisSpacing: 5, // Space between columns
          mainAxisSpacing: 1, // Space between rows
        ),
        itemCount: 3, // Number of items
        shrinkWrap: true, // Allow grid to take up only necessary space
        physics:
            const NeverScrollableScrollPhysics(), // Prevent scrolling of GridView
        itemBuilder: (context, index) {
          return Category(
              backgroundColor: AppColors.white,
              imageUrl: index == 0
                  ? AppAssets.hotel
                  : index == 1
                      ? AppAssets.villa
                      : AppAssets.tour,
              title: index == 0
                  ? AppStrings.hotel
                  : index == 1
                      ? AppStrings.villa
                      : AppStrings.experiences);
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;
  final String title;

  const Category({
    super.key,
    required this.backgroundColor,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //change size of this beautiful button
        // We can change style of this beautiful elevated button thanks to style prop
        backgroundColor: AppColors.white, // we can set primary color
        // foregroundColor: Colors.white, // change color of child prop
        //surfaceTintColor: AppColors.logoGrey, //surface color
        // shadowColor: Colors
        //     .grey, //shadow prop is a very nice prop for every button or card widgets.
        //elevation: 5, // we can set elevation of this beautiful button
        side: const BorderSide(
            color: AppColors.itemborderColor, //change border color
            width: 1, //change border width
            style: BorderStyle
                .solid), // change border side of this beautiful button

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          //change border radius of this beautiful button thanks to BorderRadius.circular function
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
        // padding: const EdgeInsets.all(10)
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (title == "Hotels") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VillaHotelSearchScreen(
                  isHotel: title == "Hotels" ? true : false)));
        } else if (title == "Villas") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const VillaResultScreen()));
        } else if (title == "Tours") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TourResultScreen()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const InsuranceResultScreen()));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageUrl),
            color: AppColors.logoGrey,
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontStyle: FontStyle.normal))
        ],
      ),
    );
  }
}
