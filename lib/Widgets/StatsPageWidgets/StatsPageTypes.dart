import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/Constants.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/controllers/AppController.dart';

class StatsPageTypes extends StatelessWidget {
  const StatsPageTypes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppController appController) {
        return Container(
          height: Get.height * 0.1,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: statsTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(16),
                      // margin: EdgeInsets.all(16),
                      duration: Duration(milliseconds: 300),
                      child: Center(
                        child: Row(
                          children: [
                            appController.currentStatType.value ==
                                    statsTypes[index]
                                ? Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: mainColor,
                                    ),
                                  )
                                : Container(),
                            Text(
                              "${statsTypes[index]}",
                              style: montserratStyle(
                                color: appController.currentStatType.value ==
                                        statsTypes[index]
                                    ? mainColor
                                    : backgroundGreyDark,
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: appController.currentStatType.value ==
                                  statsTypes[index]
                              ? white
                              : backgroundGrey),
                    ),
                    elevation:
                        appController.currentStatType.value == statsTypes[index]
                            ? 5
                            : 0,
                    shadowColor: mainColor,
                    animationDuration: Duration(milliseconds: 300),
                  ),
                  onTap: () {
                    appController.updateStatesType(statsTypes[index]);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
