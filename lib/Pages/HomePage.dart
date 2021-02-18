import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageHeader.dart';
// import 'package:savey/Widgets/HomePageWidgets/HomePageStats.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageTimeSpanFilter.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageTotalBalance.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageTransactionContainer.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageTransactionsHeader.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        clipBehavior: Clip.antiAlias,
        height: Get.height * 0.9,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(36),
            bottomLeft: Radius.circular(36),
          ),
          color: backgroundGrey,
        ),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),

            //header
            HomePageHeader(),

            SizedBox(height: Get.height * 0.01),

            //total Balance
            HomePageTotalBalance(),

            SizedBox(height: Get.height * 0.01),

            //filter by timespan

            HomePageTimeSpan(),

            //stats expenses incomes
            // HomePageStats(),

            SizedBox(height: Get.height * 0.01),

            //transactions
            HomePageTransactionsHeader(),

            //container of trans
            HomePageTransactionsContainer(),
          ],
        ),
      ),
    );
  }
}
