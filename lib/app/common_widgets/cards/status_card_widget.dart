import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

Widget orderButtonFunction(String type) {
  switch (type) {
    case "Visited":
      return statusButtonWidget(type, const Color(0xFFE4FFE0), Colors.green);

    case "Pending":
      return statusButtonWidget(
          type, const Color(0xFFFFD5B6), const Color(0xFFED893E));

    case "Viewed":
      return statusButtonWidget(
          type, const Color(0xFFFFECAA), const Color(0xFFAB8D23));

    case "Processed":
      return statusButtonWidget(
          type, const Color(0xFFE9EAFF), const Color(0xFF3F46EF));

    case "Completed":
      return statusButtonWidget(
          type, const Color(0xFFFEA500), const Color(0xFFFFFFFF));
    case "Partially Completed":
      return statusButtonWidget(
          type, const Color(0xFFE5F9FF), const Color(0xFF4C7785));
    case "Cancelled":
      return statusButtonWidget(
          type, const Color(0xFFFFE1E2), const Color(0xFFE75860));

    case "shipped":
      return statusButtonWidget(
          "Shipped", const Color(0xFFFFE1E2), const Color(0xFF4C7785));

    case "processed":
      return statusButtonWidget(
          "Processing", const Color(0xFF3585DB).withOpacity(0.1), AppColor.red);

    case "pending":
      return statusButtonWidget(
          "Pending", const Color(0xFF11c15b), const Color(0xFFFFFFFF));
    case "Followup":
      return statusButtonWidget(
          "Followup", const Color(0xFFFFEEB0), AppColor.red);
    case "TSC Pending":
      return statusButtonWidget("TSC Verification Pending",
          const Color(0xFF11c15b), const Color(0xFFFFFFFF));
    case "ZSM Pending":
      return statusButtonWidget("ZSM Verification Pending",
          const Color(0xFF11c15b), const Color(0xFFFFFFFF));
    case "BH Pending":
      return statusButtonWidget("BH Verification Pending",
          const Color(0xFF11c15b), const Color(0xFFFFFFFF));
    case "Verified":
      return statusButtonWidget(
          "Verified", const Color(0xFF11c15b), const Color(0xFFFFFFFF));

    default:
      return const SizedBox();
  }
}

Container statusButtonWidget(
  String type,
  Color color,
  Color textColor,
) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Center(
      child: Text(
        type,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
      ),
    ),
  );
}
