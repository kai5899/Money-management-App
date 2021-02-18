import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Pages/HomePage.dart';
import 'package:savey/Pages/StatsPage.dart';
import 'package:savey/controllers/AppController.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'AddTransaction.dart';
import 'ProfilePage.dart';

class BasePage extends GetWidget<AppController> {
  // BasePage({Key key}) : super(key: key);

  final controller = Get.put(AppController());
  final databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return Container(
      child: GetX<AppController>(
        init: AppController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: mainColor,
            body: PageView(
              children: [
                HomePage(),
                StatsPage(),
                HomePage(),
                ProfilePage(),
              ],
              controller: controller.pageController.value,
              physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: controller.pageNumber.value == 0
                          ? Colors.white
                          : backgroundGreyDark,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.onPageChanged(0);
                      controller.animate();
                      print(controller.pageNumber.value);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.library_books_outlined,
                      color: controller.pageNumber.value == 1
                          ? Colors.white
                          : backgroundGreyDark,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.onPageChanged(1);
                      controller.animate();
                      print(controller.pageNumber.value);
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: supportColor1,
                    child: Icon(
                      Icons.add,
                      size: 36,
                    ),
                    onPressed: () {
                      if (databaseController.wallets.length != 0) {
                        Get.to(AddTransactionPage(),
                            transition: Transition.upToDown);
                      } else {
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.warning,
                            animType: CoolAlertAnimType.slideInUp,
                            title: "No Balance",
                            text: "try adding some wallets first!");
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: controller.pageNumber.value == 2
                          ? Colors.white
                          : backgroundGreyDark,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.onPageChanged(2);
                      controller.animate();
                      print(controller.pageNumber.value);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: controller.pageNumber.value == 3
                          ? Colors.white
                          : backgroundGreyDark,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.onPageChanged(3);
                      controller.animate();
                      print(controller.pageNumber.value);
                    },
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: Get.height * 0.01),
            ),
          );
        },
      ),
    );
  }
}
