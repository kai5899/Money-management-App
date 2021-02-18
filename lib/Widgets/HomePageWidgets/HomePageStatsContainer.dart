import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';

import '../LineChartReport.dart';

class HomePageStatsContainer extends StatelessWidget {
  final Color color;
  final String title;
  final double amount;
  const HomePageStatsContainer({this.color, this.title, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(25)),
        width: Get.width * 0.42,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: LineReportChart(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.3 * 0.95 * 0.1,
              child: Container(),
            ),
            ListTile(
              title: Text(
                title,
                style: montserratStyle(color: backgroundGreyDark),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$amount",
                    style: montserratStyle(
                        color: black, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    color == Colors.green
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: color,
                    size: 36,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
