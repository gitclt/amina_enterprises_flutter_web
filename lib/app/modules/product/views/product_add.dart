import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/product_tab_one.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/product_tab_two.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAdd extends GetView<ProductController> {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(
            title:
                'Home / Product / ${controller.editId == '' ? 'Add' : 'Update'}',
            label: 'view_all'.tr,
            onClick: () {
              controller.isIndex.value = 0;
              controller.tabcontroller.animateTo(0);
              Get.rootDelegate.toNamed(Routes.product);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: PageContainer(
              child:
                  // Form(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       // Custom Tab Navigation
                  //       Row(
                  //         children: List.generate(2, (index) {
                  //           return GestureDetector(
                  //             onTap: () {
                  //               controller
                  //                   .changeTab(index); // Method to change tab index
                  //             },
                  //             child: Obx(() => TittleCard(
                  //                   label: controller.tablabel[index],
                  //                   isSelected: controller.selectedTab.value ==
                  //                       index, // Highlight if selected
                  //                 )),
                  //           );
                  //         }),
                  //       ),

                  //       20.height,

                  //       // Tab Content
                  //       SizedBox(
                  //         height: 500,
                  //         child: Obx(() => IndexedStack(
                  //               index: controller
                  //                   .tabcontroller, // Show selected tab content
                  //               children: const [
                  //                 ProductTabOne(),
                  //                 ProductTabTwo(),
                  //               ],
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  DefaultTabController(
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
                                    "Basic Information",
                                    controller.isIndex.value == 0
                                        ? AppColor.primary
                                        : const Color(0XFFF1F1F1),
                                    controller.isIndex.value == 0
                                        ? Colors.white
                                        : Colors.black,
                                    context),
                                // .paddingOnly(right: 8),
                                buildTab(
                                        "Attributes",
                                        controller.isIndex.value == 1
                                            ? AppColor.primary
                                            : const Color(0XFFF1F1F1),
                                        controller.isIndex.value == 1
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
                          ProductTabOne(),
                          ProductTabTwo(),
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

Widget buildTab(
    String label, Color borderColor, Color textColor, BuildContext context) {
  return Tab(
    child: Container(
      width: Get.width * .15,
      height: 43,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
                color: textColor,
                fontSize: Responsive.isDesktop(context) ? 12 : 10),
          ),
        ],
      ),
    ),
  );
}
