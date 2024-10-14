import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_header.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class DashCardWidgets extends StatelessWidget {
  final String header;
  final String? subHeader;
  final List<Widget> child;
  const DashCardWidgets(
      {super.key, required this.header, this.subHeader, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonHeader(
                title: header,
                subTitle: subHeader,
              ),
              Wrap(
                spacing: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.02
                    : Responsive.isMobile(context)
                        ? 10
                        : 10,
                runSpacing: 15,
                children: child,
              ).paddingSymmetric(horizontal: 10, vertical: 20)
            ],
          ),
        ));
  }
}
