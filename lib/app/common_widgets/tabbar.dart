

import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildTab(
    String label, Color borderColor, Color textColor, BuildContext context) {
  return Tab(
    child: Container(
      width: Get.width * .15,
      height: 43,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
                color: textColor,
                fontSize: Responsive.isDesktop(context) ? 12 : 10),
          ),
        ],
      ),
    ),
  );
}
