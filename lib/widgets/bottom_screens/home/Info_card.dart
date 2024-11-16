import 'dart:math';

import 'package:bta/utils/assets.dart';
import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:bta/utils/strings.dart';
import 'package:flutter/material.dart';

List<String> images = AppAssets.listOfCardImages;

class VacationsPackages extends StatefulWidget {
  static const String path = "lib/src/pages/travel/tstory.dart";

  const VacationsPackages({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VacationsPackagesState createState() => _VacationsPackagesState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _VacationsPackagesState extends State<VacationsPackages> {
  double? currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.getAppLayoutRadius)),
          gradient: const LinearGradient(
              colors: [AppColors.logoGrey, AppColors.primary],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(
              right: 20.0,
              top: 15,
              left: 20,
            ),
            child: Text(AppStrings.homeCard,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'LucidaUnicodeCalligraphy',
                  fontSize: 22.0,
                  // fontFamily: "Calibre-Semibold",
                  letterSpacing: 1.0,
                )),
          ),
          Stack(
            children: <Widget>[
              CardScrollWidget(currentPage!),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: controller,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  final padding = 20.0;
  final verticalInset = 20.0;
  double? currentPage = images.length - 1.0;

  CardScrollWidget(this.currentPage, {super.key});
  @override
  Widget build(BuildContext context) {
    var cardAspectRatio = 12.0 / 16.0;
    var widgetAspectRatio = cardAspectRatio * 1.2;
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage!;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), //card radius here
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                AppColors.black.withOpacity(.8),
                                AppColors.black.withOpacity(.2)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              tileMode: TileMode.clamp),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(AppStrings.homeCardTitle[i],
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontFamily: 'LucidaUnicodeCalligraphy',
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.normal)),
                            ),
                            // const SizedBox(
                            //   height: 5.0,
                            // ),
                            // // Padding(
                            // //   padding: const EdgeInsets.symmetric(
                            // //       horizontal: 16.0, vertical: 8.0),
                            // //   child: Text(AppStrings.homeCardSubTitle[i],
                            // //       style: const TextStyle(
                            // //         color: Colors.white,
                            // //         fontSize: 16.0,
                            // //       )),
                            // // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
