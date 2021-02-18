
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/models/Category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final Function onDelete;

  const CategoryWidget({this.category, this.onDelete});

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
              bottom: 5,
              left: 5,
              right: 5,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(category.color)),
              ),
            ),
            Positioned(
              child: Center(
                child: Text(
                  "${category.title.capitalizeFirst}",
                  style: montserratStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              top: 40,
              left: 5,
              right: 5,
            ),
          ],
        ),
      ),
      onDoubleTap: () {
        onDelete();
      },
    );
  }
}
