import 'package:flutter/material.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';

class FieldEdited extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final FocusNode focusNode;
  final TextInputType type;
  final Color color;
  final Color textColor;

  const FieldEdited(
      {Key key,
      this.label,
      this.controller,
      this.icon,
      this.type,
      this.isPassword,
      this.focusNode,
      this.color,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 1),
          color: color ?? backgroundGrey.withOpacity(0.5),
        ),
        height: 60,
        child: Padding(
          child: TextFormField(
            focusNode: focusNode,
            obscureText: isPassword,
            cursorColor: white,
            keyboardType: type,
            style: montserratStyle(color: mainColor),
            decoration: InputDecoration(
              prefix: SizedBox(
                width: 20,
              ),
              fillColor: mainColor,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: controller,
          ),
          padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
    );
  }
}
