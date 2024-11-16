import 'package:bta/utils/colors.dart';
import 'package:bta/utils/screen_size.dart';
import 'package:flutter/material.dart';

class MyAppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? textChangedRef;
  final String appbarTitle;

  MyAppBarSearch(
      {super.key, required this.textChangedRef, required this.appbarTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.red,
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.red,
              height: SizeConfig.blockSizeVertical * 8,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
              // color: Colors.amber,
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 3,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          appbarTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.green,
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    cursorColor: Colors.greenAccent,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    onChanged: textChangedRef,
                    autofocus: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Search Location Here',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final double appBarHeight = SizeConfig.blockSizeVertical * 16 + 15;
  @override
  get preferredSize => Size.fromHeight(appBarHeight);
}
