import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class AppColor {
  static Color primary = isStaging == true
      ? const Color(0xff6a5acd)
      : const Color(0xFFff0000); //0xff51CDF1 //8874a3
  static Color background = Colors.white;
  static Color secondaryBackground = const Color(0xffF4F6FF);
  static const Color textGrayColor = Color(0xff666666);
  static const Color scaffoldBgColor = Color(0xffEDF3F5);
  static Color green = const Color(0xff038900);
  static Color red = const Color(0xffff0000);
  static Color violet = const Color(0xff673698);
  static Color grey = const Color(0xffd7d7d7);
  static Color black = const Color(0xff484848);
  static Color orange = const Color(0xffFF8A5A);
  static Color peal = const Color(0xff79C7B8);
  static Color matteBlue = const Color(0xff707FBE);
  static Color matteRed = const Color(0xffC16267);
  static Color rose = const Color(0xffE659BE);
  static Color lightGreen = const Color(0xffC1E659);
  static Color profileBlue = const Color(0xff445BA8);
  static Color profileButtonBg = const Color(0xffECF0FB);
  static Color profileButtonLabel = const Color(0xff8697C9);
  static Color white = Colors.white;
  static const Color blackColor = Color(0xFF565A64);
  static const Color dividerColor = Color(0xffE4E4E4);
  static const Color greyColor = Color(0xFFB7B7B7);
  static const Color tabTextColor = Color(0xFF666666);
  static const appointTextColor = Color(0xFFDD1D2E);
  static const boxBorderColor = Color(0xFFE9ECEF);
}
