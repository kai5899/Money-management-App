import 'package:flutter/material.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';

class ProfileOption extends StatelessWidget {
  final String icon;
  final String title;
  final Function onPressed;

  const ProfileOption({Key key, this.icon, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            color: white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: mainColor,
              width: 0.1,
            )),
        child: ListTile(
          leading: Hero(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(360),
                // color: white,
                image: DecorationImage(
                    image: Image.asset("assets/icons/$icon.png").image,
                    fit: BoxFit.contain),
              ),
            ),
            tag: "${title.toLowerCase()}",
          ),
          title: Text(
            "$title",
            style: montserratStyle(
                color: mainColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
