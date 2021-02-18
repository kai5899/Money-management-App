import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

successAlert(
    {BuildContext context, String title, String message, Color color}) {
  CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: "$title",
      animType: CoolAlertAnimType.slideInUp,
      text: "$message",
      confirmBtnText: "Yay!",
      confirmBtnColor: color ?? Colors.green[900],
      onConfirmBtnTap: () {
        Get.back();
      });
}

errorAlert(BuildContext context, String title, String message) {
  CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      animType: CoolAlertAnimType.scale,
      title: "$title",
      text: "$message",
      confirmBtnColor: Colors.red,
      confirmBtnText: "Ok",
      onConfirmBtnTap: () {
        Get.back();
      });
}

deleteAlert({BuildContext context, String type, Function delete}) {
  CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      text: "Are you sure you want to delete this $type?",
      title: "Delete $type!",
      confirmBtnText: "Yes",
      confirmBtnColor: Colors.red,
      animType: CoolAlertAnimType.slideInDown,
      showCancelBtn: true,
      onConfirmBtnTap: () {
        delete();
      },
      onCancelBtnTap: () {
        Get.back();
      });
}

getWhen(date) {
  DateTime now = DateTime.now();
  String when;
  if (date.day == now.day)
    when = "Today";
  else if (date.day == now.subtract(Duration(days: 1)).day)
    when = "Yesterday";
  else
    when = DateFormat.MMMd().format(date);
  return when + " " + "at" + " " + DateFormat.jm().format(date);
}
