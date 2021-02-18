import 'package:flutter/material.dart';

import 'HomePageStatsContainer.dart';

class HomePageStats extends StatelessWidget {
  const HomePageStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomePageStatsContainer(
              color: Colors.green,
              title: "Income",
              amount: 2225.5,
            ),
            HomePageStatsContainer(
              color: Colors.red,
              title: "Expenses",
              amount: 800.90,
            )
          ],
        ),
      ),
    );
  }
}
