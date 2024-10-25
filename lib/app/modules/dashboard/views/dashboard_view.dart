import 'package:amina_enterprises_flutter_web/app/common_widgets/general_exception.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/internet_exceptions_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/modules/dashboard/views/widget/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        body: Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              if (controller.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    controller.getDashboardCount();
                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  controller.getDashboardCount();
                });
              }
            case Status.completed:
              return CommonPagePadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardHeaderCard(
                        header: 'Dashboard',
                        child: controller.dashboardCount.map((item) {
                          return DashboardCard(
                            lable: item.name.toString(),
                            count: item.count.toString(),
                            color: getColorForItem(item.name.toString()),
                            onTap: () {
                              switch (item.name) {
                                // case "Lead":
                                //   Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                                // case "Prospective1":
                                //   // Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                                // case "Prospective2":
                                //   // Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                                // case "Customer":
                                //   // Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                                // case "InactiveCustomer":
                                //   // Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                                // case "LeadEnquiry":
                                //   // Get.rootDelegate.toNamed(Routes.viewLeads);
                                //   break;
                              }
                            },
                          );
                        }).toList()),
                  ],
                ),
              );
          }
        }));
  }

  Color getColorForItem(String name) {
    switch (name) {
      case "Lead":
        return const Color(0xffe73268);
      case "Prospective1":
        return const Color(0xff78428e);
      case "Prospective2":
        return const Color(0xfff1d218);
      case "Customer":
        return const Color(0xffdd6d22);
      case "InactiveCustomer":
        return const Color(0xff6e852d);
      case "LeadEnquiry":
        return const Color(0xff0a3473);
      default:
        return Colors.grey;
    }
  }
}
