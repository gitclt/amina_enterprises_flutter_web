import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/tabbar.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/controllers/route_setting_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/views/route_setting_tab.dart/tab_one.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/views/route_setting_tab.dart/tab_two.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/views/route_setting_tab.dart/tab_three.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteSettingAdd extends GetView<RouteSettingController> {
  const RouteSettingAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(
            title:
                'Home / Route Settings / ${controller.editId == '' ? 'Add' : 'Update'}',
            label: 'view_all'.tr,
            onClick: () {
              controller.isIndex.value = 0;
              controller.tabcontroller.animateTo(0);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: PageContainer(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => SizedBox(
                          height: 45,
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.6 / 2
                              : size.width * 0.6 / 2,
                          child: IgnorePointer(
                            // ignoring: controller.isEdit.value ? false : true,
                            child: TabBar(
                              unselectedLabelColor: Colors.transparent,
                              controller: controller.tabcontroller,
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: false,
                              labelPadding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent,
                              ),
                              onTap: (int index) {
                                controller.isIndex.value = index;
                              },
                              tabs: [
                                buildTab(
                                    "Add Route",
                                    controller.isIndex.value == 0
                                        ? AppColor.primary
                                        : const Color(0XFFF1F1F1),
                                    controller.isIndex.value == 0
                                        ? Colors.white
                                        : Colors.black,
                                    context),
                                // .paddingOnly(right: 8),
                                buildTab(
                                    "Add Customer",
                                    controller.isIndex.value == 1
                                        ? AppColor.primary
                                        : const Color(0XFFF1F1F1),
                                    controller.isIndex.value == 1
                                        ? Colors.white
                                        : Colors.black,
                                    context),
                                buildTab(
                                        "View Customer",
                                        controller.isIndex.value == 2
                                            ? AppColor.primary
                                            : const Color(0XFFF1F1F1),
                                        controller.isIndex.value == 2
                                            ? Colors.white
                                            : Colors.black,
                                        context)
                                    .paddingOnly(right: 8),
                              ],
                            ),
                          ),
                        ).paddingOnly(
                          // left: 15,
                          bottom: 20,
                        )),
                    SizedBox(
                      height: 500,
                      child: TabBarView(
                        controller: controller.tabcontroller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const <Widget>[
                          TabOne(),
                          TabThree(),
                          TabTwo(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
