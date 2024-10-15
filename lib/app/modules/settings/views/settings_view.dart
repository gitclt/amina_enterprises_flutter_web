import 'package:amina_enterprises_flutter_web/app/common_widgets/cards/dash_card_widgets.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/cards/dash_cards.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                DashHeaderCardWidgets(header: 'Master Settings', child: [
                  DashCards(
                    lable: 'Role',
                    onTap: () {
                      //  Get.rootDelegate.toNamed(Routes.role);
                    },
                  ),
                  DashCards(
                    lable: 'Place',
                    onTap: () {
                      // Get.rootDelegate.toNamed(Routes.place);
                    },
                  ),
                  DashCards(
                    lable: 'Designation',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'State',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'District',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'Color',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'Brand',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'Construction',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                  DashCards(
                    lable: 'Category',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                   DashCards(
                    lable: 'Sub Category',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.designation);
                    },
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
