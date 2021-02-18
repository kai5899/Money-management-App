import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/WalletsPageWidgets/WalletsPageBody.dart';
import 'package:savey/Widgets/WalletsPageWidgets/WalletsPagePanel.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WalletsPage extends StatelessWidget {
  WalletsPage({Key key}) : super(key: key);

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
          "Wallets",
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
                    image: Image.asset("assets/icons/wallet.png").image,
                    fit: BoxFit.contain),
              ),
            ),
            tag: "wallets",
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
            WalletsPageBody(),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
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
              ),
            )
          ],
        ),
        panelBuilder: (ScrollController sc) => WalletsPagePanel(
          sc: sc,
          panelController: mycontroller,
        ),
      ),
    );
  }
}
