import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/product_tab_one.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/product_tab_two.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/tab_tittle_card.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAdd extends GetView<ProductController> {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2, // Two tabs
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(
              title:
                  'Home / Product / ${controller.editId == '' ? 'Add' : 'Update'}',
              label: 'view_all'.tr,
              onClick: () {
                Get.rootDelegate.toNamed(Routes.product);
              },
            ),
            PageContainer(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Custom Tab Navigation
                    Row(
                      children: List.generate(2, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller
                                .changeTab(index); // Method to change tab index
                          },
                          child: Obx(() => TittleCard(
                                label: controller.tablabel[index],
                                isSelected: controller.selectedTab.value ==
                                    index, // Highlight if selected
                              )),
                        );
                      }),
                    ),

                    20.height,

                    // Tab Content
                    SizedBox(
                      height: 500,
                      child: Obx(() => IndexedStack(
                            index: controller
                                .selectedTab.value, // Show selected tab content
                            children: const [
                              ProductTabOne(), 
                              ProductTabTwo(), 
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
