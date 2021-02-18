import 'package:flutter/material.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/models/Wallet.dart';
import 'package:get/get.dart';

class WalletLegendStatsPage extends StatelessWidget {
  final Wallet data;
  final double totalOfWalletsamounts;
  const WalletLegendStatsPage({Key key, this.data, this.totalOfWalletsamounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Material(
        elevation: 1,
        // shadowColor: mainColor,
        color: white,

        borderRadius: BorderRadius.circular(15),
        child: Container(
          // margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(bottom: 10, top: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset("assets/icons/${data.icon}.png")
                            .image)),
              ),
              title: Text(
                data.title.capitalizeFirst,
                style: montserratStyle(
                    color: mainColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: mainColor.withOpacity(
                          data.amount / totalOfWalletsamounts,
                        ),
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${((data.amount / totalOfWalletsamounts) * 100).toStringAsFixed(1)} %",
                    style: montserratStyle(
                        color: mainColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Text(
                data.amount.toString(),
                style: montserratStyle(
                    color: mainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
