import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/CategoriesPageWidgets/CategoryWidget.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:savey/models/Category.dart';

class CategoriesPageBody extends StatelessWidget {
  CategoriesPageBody({Key key}) : super(key: key);

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: Get.height * 0.78,
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
          SizedBox(
            height: Get.height * 0.05,
          ),
          Obx(() => Expanded(
                child: Container(
                  width: Get.width * 0.95,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: databaseController.categories.length == 0
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "No Categories yet add some",
                                style: montserratStyle(
                                    color: mainColor, fontSize: 36),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                size: 360,
                                color: mainColor,
                              )
                            ],
                          ),
                        )
                      : GridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          padding: const EdgeInsets.all(16.0),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          children: databaseController.categories
                              .map((Category category) {
                            return CategoryWidget(
                              category: category,
                              onDelete: () => databaseController.deleteCategory(
                                  category: category, context: context),
                            );
                          }).toList()),
                ),
              )),
        ],
      ),
    );
  }
}
