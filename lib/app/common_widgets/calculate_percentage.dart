import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

calculatePercentage(String achieved, String target) {
  double achievedQty = double.parse(achieved);
  double targetQty = double.parse(target);
  double percent = (achievedQty / targetQty) * 100;

  return percent.toStringAsFixed(3);
}

calculateBal(String sale, String target) {
  double totalSale = double.parse(sale);
  double monthTarget = double.parse(target);
  double balance = totalSale - monthTarget;

  return balance.toStringAsFixed(3);
}

class CalculateSalePercent extends StatelessWidget {
  final String sale;
  final String target;
  final double fontSize;
  const CalculateSalePercent(
      {super.key,
      required this.sale,
      required this.target,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: double.parse(target) > double.parse(sale)
              ? AppColor.red
              : AppColor.green),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          calculatePercentage(sale, target),
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
