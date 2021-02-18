import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/CategoriesPageWidgets/CategoriesPageBody.dart';
import 'package:savey/Widgets/CategoriesPageWidgets/CategoriesPagePanel.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key key}) : super(key: key);

  final PanelController mycontroller = PanelController();
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
          "Categories",
          style: montserratStyle(
              color: mainColor, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Hero(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(360),
                // color: white,
                image: DecorationImage(
                    image: Image.asset("assets/icons/archive.png").image,
                    fit: BoxFit.contain),
              ),
            ),
            tag: "categories",
          ),
        ],
      ),
      body: SlidingUpPanel(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
        onPanelClosed: () {
          databaseController.clearWalletControllers();
        },
        controller: mycontroller,
        minHeight: 0,
        maxHeight: Get.height * 0.9,
        body: Column(
          children: [
            CategoriesPageBody(),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Container(
              child: Center(
                child: FloatingActionButton(
                  backgroundColor: supportColor1,
                  child: Icon(
                    Icons.add,
                    size: 36,
                  ),
                  onPressed: () {
                    mycontroller.open();
                  },
                ),
              ),
            )
          ],
        ),
        panelBuilder: (ScrollController sc) => CategoriesPagePanel(
          sc: sc,
          // panelController: mycontroller,
        ),
      ),
    );
  }
}
