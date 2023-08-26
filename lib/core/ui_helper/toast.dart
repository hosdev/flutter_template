import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum SnakeBarStatus {
  success,
  error,
  note;

  get color {
    switch (this) {
      case SnakeBarStatus.success:
        return Colors.green;
      case SnakeBarStatus.error:
        return Colors.red;

      case SnakeBarStatus.note:
        return Colors.blueGrey;
    }
  }
}

class ToastHelper {
  static showToast({required String text, required SnakeBarStatus status}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: status.color,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
