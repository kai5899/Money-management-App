import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/controllers/DatabaseController.dart';

class HomePageTotalBalance extends StatelessWidget {
  final containerHeight = Get.height * 0.14;
  final DatabaseController databaseController = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: Get.width * 0.9,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [mainColor, white],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Text(
              "Remaining Balance",
              style: chilankaStyle(
                  color: white.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            top: containerHeight * 0.3,
            left: Get.width * 0.8 * 0.1,
          ),
          Positioned(
            child: Obx(
              () {
                return Text(
                  "\$ ${databaseController.totalOfWalletsamounts - databaseController.totalOfTransactionsamount}",
                  style: montserratStyle(
                    color: white,
                    fontSize: 24,
                  ),
                );
              },
            ),
            top: containerHeight * 0.5,
            left: Get.width * 0.8 * 0.1,
          ),
          Positioned(
            child: Container(
              height: Get.width * 0.25,
              width: Get.width * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/icons/wallet_1.png").image)),
            ),
            right: Get.width * 0.8 * 0.1,
            bottom: -containerHeight * 0.05,
          )
        ],
      ),
    );
  }
}
