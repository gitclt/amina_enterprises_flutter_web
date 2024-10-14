import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  final Widget child;
  const SimpleContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.boxBorderColor),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: child,
    );
  }
}
