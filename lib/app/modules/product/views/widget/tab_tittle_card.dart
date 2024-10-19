import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TittleCard extends StatelessWidget {
  final String label;
  final BorderRadius? borderRadius;
  final bool isSelected;
  const TittleCard(
      {super.key,
      required this.label,
      required this.isSelected,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(label,
                style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFFB0B0B0),
                    fontSize: 12)),
          ),
        ),
      ),
    );
  }
}
