import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/StatsPageWidgets/StatsPageTypes.dart';
import 'package:savey/controllers/DatabaseController.dart';

class StatsPage extends StatelessWidget {
  StatsPage({Key key}) : super(key: key);
  final databaseController = Get.put(DatabaseController());
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
            Container(
              child: Center(
                child: Text(
                  "Statisticss",
                  style: montserratStyle(
                    color: mainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: Get.height * 0.05,
              width: Get.width,
            ),

            StatsPageTypes(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Center(
                  child: PieChart(
                    PieChartData(
                        sections: databaseController.getWalletsSection(),
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 10,
                        centerSpaceRadius: 60),
                  ),
                ),
              ),
            ),

            Expanded(
                child: Container(
              width: Get.width * 0.9,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: databaseController.getWalletLegends(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
