import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: Responsive.isDesktop(context)
                  ? 20
                  : Responsive.isMobile(context)
                      ? 10
                      : 10,
              runSpacing: 15,
              children: [
                // ReportMainCard(header: 'Master Settings', child: [
                //   ReporCard(
                //     lable: 'Employee',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.viewEmployee);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.product);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Role',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.role);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product Category',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.productCategory);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product Sub-Category',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.productSubCategory);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product Group',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.productGroup);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product Sub-Group',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.productSubGroup);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Product Application',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.productApplication);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Place',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.place);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Branch',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.branch);
                //     },
                //   ),
                //   ReporCard(
                //     lable: 'Designation',
                //     onTap: () {
                //       Get.rootDelegate.toNamed(Routes.designation);
                //     },
                //   ),
                // ])
              ],
            ),
          ),
        ));
  }
}
