import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/GeneralFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/controllers/DatabaseController.dart';
import 'package:savey/models/Transaction.dart';

class HomePageTransView extends StatelessWidget {
  final Transaction transaction;
  final DatabaseController databaseController = Get.put(DatabaseController());

  HomePageTransView({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Slidable(
        actionExtentRatio: 0.2,
        actionPane: SlidableBehindActionPane(),
        secondaryActions: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.delete,
                  color: white,
                ),
              ),
            ),
            onTap: () {
              databaseController.deleteTransaction(
                  context: context, transaction: transaction);
            },
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: supportColor2,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  // color: supportColor2,
                  image: DecorationImage(
                      image: Image.asset(
                              "assets/icons/categories/${transaction.icon}.png")
                          .image)),
            ),
            title: Text(
              transaction.title,
              style: montserratStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                getWhen(DateTime.fromMillisecondsSinceEpoch(transaction.id))),
            trailing: Text(
              "-\$ ${transaction.amount}",
              style: montserratStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
