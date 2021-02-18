import 'package:flutter/material.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';

class HomePageTransactionsHeader extends StatelessWidget {
  const HomePageTransactionsHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction History",
                    style: montserratStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  ChoiceChip(
                    selected: true,
                    onSelected: (b) {},
                    label: Text("SORT BY"),
                  )
                ],
              ),
              padding: EdgeInsets.only(left: 25, right: 25),
            );
  }
}