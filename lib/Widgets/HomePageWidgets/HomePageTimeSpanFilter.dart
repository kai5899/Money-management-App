import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/Constants.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/controllers/AppController.dart';
import 'package:savey/controllers/DatabaseController.dart';

class HomePageTimeSpan extends StatelessWidget {
  final DatabaseController databaseController = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppController appController) {
        return Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: timeSpans.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ChoiceChip(
                    selected:
                        appController.currentFilter.value == timeSpans[index]
                            ? true
                            : false,
                    selectedColor: supportColor3.withOpacity(0.8),
                    padding: EdgeInsets.all(8),
                    backgroundColor: supportColor2,
                    label: Text(
                      timeSpans[index],
                      style: montserratStyle(color: white, fontSize: 18),
                    ),
                    onSelected: (b) {
                    }),
              );
            },
          ),
        );
      },
    );
  }
}
