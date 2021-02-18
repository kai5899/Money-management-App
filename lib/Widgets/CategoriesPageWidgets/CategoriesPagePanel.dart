import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/InputField.dart';
import 'package:savey/controllers/DatabaseController.dart';

class CategoriesPagePanel extends StatelessWidget {
  CategoriesPagePanel({Key key, this.sc}) : super(key: key);
  final ScrollController sc;

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
              "Name this Category : ",
              style: montserratStyle(
                  color: mainColor, fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.all(16),
          ),
          FieldEdited(
            isPassword: false,
            type: TextInputType.text,
            controller: databaseController.categoryTitleController,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Obx(() {
            return ColorPicker(
              color: Color(databaseController.selectedCategoryColor.value),
              onColorChanged: (Color color) {
                databaseController.selectedCategoryColor.value = color.value;
                print(databaseController.selectedCategoryColor.value);
              },
              heading: Text(
                'Select color',
                style: Theme.of(context).textTheme.headline5,
              ),
              subheading: Text(
                'Select color shade',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }),
          GestureDetector(
            child: Container(
              width: Get.width * 0.4,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(left: 36, right: 36),
              child: Center(
                child: Text(
                  "Add Category",
                  style: montserratStyle(
                    color: white,
                    fontSize: 24,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.green[600]),
            ),
            onTap: () {
              databaseController.insertCategory(context);
            },
          )
        ],
      ),
    );
  }
}
