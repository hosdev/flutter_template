
import 'package:flutter/material.dart';

class AppSizes{
  static double getDeviceHeight(BuildContext context){
    return MediaQuery.of(context).size.longestSide;
  }
  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static const bodyPadding=25.0;
  static  const double inputFieldSpace=20;

}