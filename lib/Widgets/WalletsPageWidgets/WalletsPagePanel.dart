import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/InputField.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WalletsPagePanel extends StatelessWidget {
  WalletsPagePanel({Key key, this.sc, this.panelController}) : super(key: key);
  final ScrollController sc;
  final PanelController panelController;

  final databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        controller: sc,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Container(
            child: Text(
              "Name this Wallet : ",
              style: montserratStyle(
                  color: mainColor, fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.all(16),
          ),
          FieldEdited(
            isPassword: false,
            type: TextInputType.text,
            controller: databaseController.walletTitleController,
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
            controller: databaseController.walletAmountController,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
            child: Text(
              "Select Icon : ",
              style: montserratStyle(
                  color: mainColor, fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.all(16),
          ),
          Obx(() {
            return Wrap(
              children: List.generate(
                6,
                (index) => Container(
                  margin: EdgeInsets.all(8),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: databaseController.selectWalletIcon.value ==
                            "wallet_${index + 1}"
                        ? mainColor.withOpacity(1)
                        : white.withOpacity(0.6),
                    image: DecorationImage(
                      image: Image.asset(
                        "assets/icons/wallet_${index + 1}.png",
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      databaseController
                          .changeWalletIcon("wallet_${index + 1}");
                    },
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            height: Get.height * 0.02,
          ),
          GestureDetector(
            child: Container(
              width: Get.width * 0.4,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(left: 36, right: 36),
              child: Center(
                child: Text(
                  "Add Wallet",
                  style: montserratStyle(
                    color: white,
                    fontSize: 24,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.green),
            ),
            onTap: () {
              databaseController.insertWallet(context: context);
            },
          )
        ],
      ),
    );
  }
}
