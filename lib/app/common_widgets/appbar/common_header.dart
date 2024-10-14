import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CommonHeader extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final String? subTitle;
  final String? label;

  const CommonHeader({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.label,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            offset: const Offset(0, 0), // X, Y position
            blurRadius: 20, // Blur radius
            spreadRadius: 0, // Spread radius
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 7,
            height: MediaQuery.of(context).size.height * 0.045,
            color: AppColor.primary,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              if (subTitle != null)
                const SizedBox(
                  height: 3,
                ),
              if (subTitle != null)
                Text(subTitle!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ).paddingOnly(right: 15),
    );
  }
}
