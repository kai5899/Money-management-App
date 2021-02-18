import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/controllers/AppController.dart';

class HomePageHeader extends StatelessWidget {
  final AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: supportColor2,
            image: DecorationImage(
                image: Image.asset("assets/icons/boy.png").image)),
      ),
      title: Text(
        "Hi,${appController.greetingMessage.value}",
        style: montserratStyle(
          color: mainColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Mr.Universe Education"),
      trailing: Icon(
        Icons.notifications,
        color: mainColor,
        size: 36,
      ),
    );
  }
}
