import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Container hexColorContainer(String colorCode) {
  return Container(
      width: 15,
      height: 15,
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: hexToColor(colorCode))),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: hexToColor(colorCode)),
        ),
      ));
}
