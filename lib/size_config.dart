import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenHeight;
  static double screenWidth;
  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }
}

double screenHeightResp(double inputHeight){
  double screenHeight = SizeConfig.screenHeight;
  // 812.0 adalah height yang digunakan designer
  return (inputHeight / 812.0) * screenHeight;
}

double screenWidthResp(double inputWidth){
  double screenWidth = SizeConfig.screenWidth;
  // 375.0 adalah width yang digunakan designer
  return (inputWidth / 375.0) * screenWidth;
}