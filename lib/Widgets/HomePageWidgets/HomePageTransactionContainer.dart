import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/HomePageWidgets/HomePageTransView.dart';
import 'package:savey/controllers/DatabaseController.dart';

class HomePageTransactionsContainer extends StatelessWidget {
  HomePageTransactionsContainer({Key key}) : super(key: key);
  final SlidableController slidableController = SlidableController();

  final databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
          color: white,
        ),
        child: Obx(() {
          return databaseController.transactions.length == 0
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "No Transactions yet add some",
                        style: montserratStyle(color: mainColor, fontSize: 36),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_downward,
                        size: Get.width * 0.75,
                        color: mainColor,
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: databaseController.transactions.length,
                  itemBuilder: (context, int index) {
                    return HomePageTransView(
                      transaction: databaseController.transactions[index],
                    );
                  },
                );
        }),
      ),
    );
  }
}
