import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

class BudgetNameContainer extends StatelessWidget {
  final String label;
  final double fontSize;
  final String? nameQty;
  final String? leadName;
  final String? leadQty;

  const BudgetNameContainer(
      {super.key,
      required this.label,
      required this.fontSize,
      this.nameQty,
      this.leadName,
      this.leadQty});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              xtraBoldText(label, fontSize, color: AppColor.primary),
              if (nameQty != null)
                xtraBoldText(nameQty!, fontSize, color: AppColor.primary)
            ],
          ),
          if (leadName != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                xtraBoldText(leadName!, fontSize, color: AppColor.primary),
                xtraBoldText(leadQty!, fontSize, color: AppColor.primary)
              ],
            ),
        ],
      ),
    );
  }
}
