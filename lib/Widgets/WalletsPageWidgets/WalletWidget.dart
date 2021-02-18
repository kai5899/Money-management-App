import 'package:flutter/material.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/models/Wallet.dart';

class WalletWidget extends StatelessWidget {
  final Wallet wallet;
  final Function onDelete;

  const WalletWidget({this.wallet, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundGrey,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image:
                          Image.asset("assets/icons/${wallet.icon}.png").image),
                ),
              ),
            ),
            Positioned(
              child: Text(
                "${wallet.title}",
                style: montserratStyle(color: mainColor, fontSize: 18),
              ),
              bottom: 50,
              left: 5,
            ),
            Positioned(
              child: Text(
                "${wallet.amount} \$",
                style: montserratStyle(color: mainColor, fontSize: 18),
              ),
              bottom: 20,
              left: 5,
            )
          ],
        ),
      ),
      onDoubleTap: () {
        onDelete();
      },
    );
  }
}
