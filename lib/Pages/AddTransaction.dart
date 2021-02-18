import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/CategoriesPageWidgets/CategoryAddPage.dart';
import 'package:savey/Widgets/InputField.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:savey/models/Category.dart';

class AddTransactionPage extends StatelessWidget {
  final databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: backgroundGrey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "New Transaction",
          style: montserratStyle(
              color: mainColor, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        centerTitle: true,
      ),
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Name this transaction : ",
                  style: montserratStyle(
                      color: mainColor, fontWeight: FontWeight.w500),
                ),
                margin: EdgeInsets.all(16),
              ),
              FieldEdited(
                isPassword: false,
                type: TextInputType.text,
                color: white,
                controller: databaseController.transactionTitleController,
              ),
              Container(
                child: Text(
                  "Enter its amount : ",
                  style: montserratStyle(
                      color: mainColor, fontWeight: FontWeight.w500),
                ),
                margin: EdgeInsets.all(16),
              ),
              FieldEdited(
                isPassword: false,
                type: TextInputType.number,
                color: white,
                controller: databaseController.transactionAmountController,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category : ",
                        style: montserratStyle(
                            color: mainColor, fontWeight: FontWeight.w500),
                      ),
                      ChoiceChip(
                        label: Text("add category"),
                        labelStyle: montserratStyle(color: mainColor),
                        selected: true,
                        onSelected: (b) {
                          Get.to(
                            Scaffold(
                              body: CategoryAddPage(),
                            ),
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                      )
                    ],
                  ),
                ),
                margin: EdgeInsets.all(16),
              ),
              Center(
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
                          ],
                        ),
                      )
                    : Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: Obx(() {
                          return ListView(
                            physics: BouncingScrollPhysics(),
                            children: List.generate(
                                databaseController.categories.length, (index) {
                              Category category =
                                  databaseController.categories[index];
                              return Padding(
                                child: ListTile(
                                  horizontalTitleGap: 0,
                                  minLeadingWidth: 30,
                                  leading: Container(
                                    width: 8,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(category.color),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                  ),
                                  title: Text(
                                    category.title,
                                    style: montserratStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  trailing: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: backgroundGreyDark),
                                    child: Center(
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: databaseController
                                                        .selectedCategoryId
                                                        .value ==
                                                    category.id
                                                ? mainColor
                                                : backgroundGreyDark),
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    databaseController
                                        .changeCategoryID(category.id);
                                    databaseController.selectedCategoryColor
                                        .value = category.color;

                                    print(
                                        databaseController.selectedCategoryId);
                                  },
                                ),
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 4, top: 4),
                              );
                            }),
                          );
                        }),
                      ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Icon : ",
                      style: montserratStyle(
                          color: mainColor, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        ChoiceChip(
                          label: Text("Previous"),
                          selected: true,
                          onSelected: (b) {
                            if (!(databaseController.startTIcon.value - 8 ==
                                -8)) {
                              databaseController.paginateLess();
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ChoiceChip(
                          label: Text("Next"),
                          selected: true,
                          onSelected: (b) {
                            if (!(databaseController.startTIcon.value + 8 ==
                                120)) {
                              databaseController.paginateMore();
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.all(16),
              ),
              Center(
                child: Container(
                  // height: Get.height * 0.3,
                  width: Get.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: Obx(() {
                    int start = max(databaseController.startTIcon.value, 0);
                    int end = min(databaseController.endTIcon.value, 119);
                    return Wrap(
                      children: List.generate(119, (index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          height: Get.width * 0.95 * 0.2,
                          width: Get.width * 0.95 * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: databaseController
                                        .selectTransactionIcon.value ==
                                    "$index"
                                ? mainColor.withOpacity(1)
                                : white.withOpacity(0.6),
                            image: DecorationImage(
                                image: Image.asset(
                                  "assets/icons/categories/$index.png",
                                  fit: BoxFit.contain,
                                  height: 60,
                                  width: 60,
                                ).image,
                                fit: BoxFit.contain),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              databaseController
                                  .changeTransactionIcon("$index");
                            },
                          ),
                        );
                      }).sublist(start, end),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    width: Get.width * 0.7,
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.only(left: 36, right: 36, bottom: 20),
                    child: Center(
                      child: Text(
                        "Save Transaction",
                        style: montserratStyle(
                          color: white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.green),
                  ),
                  onTap: () {
                    databaseController.insertTransaction(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
