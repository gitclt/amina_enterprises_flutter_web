import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/size/controllers/size_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeAdd extends GetView<SizeController> {
  const SizeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Master / Size / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.size);
            },
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Form(
              key: controller.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: Responsive.isDesktop(context)
                        ? size.width * 0.03
                        : Responsive.isMobile(context)
                            ? 50
                            : 50,
                    runSpacing: 20,
                    children: [
                      AddTextFieldWidget(
                        width: Responsive.isDesktop(context)
                            ? size.width * 0.35
                            : size.width * .32,
                        textController: controller.nameController,
                        label: 'Size',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Size';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => DropDown3Widget(
                          label: 'Main Category',
                          hint: '--Select Main Category--',
                          selectedItem: controller.dropDownMainCat.id == null
                              ? null
                              : controller.dropDownMainCat,
                          items: controller.mainCatDropList,
                          isLoading: controller.isMainCatLoading.value,
                          validator: (value) {
                            if (value == null) {
                              return 'Select Main Category';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownMainCat = data;
                          },
                        ),
                      ),
                      Obx(
                        () => DropDown3Widget(
                          label: 'Category',
                          hint: '--Select Category--',
                          selectedItem: controller.dropDownCategory.id == null
                              ? null
                              : controller.dropDownCategory,
                          items: controller.categoryDropList,
                          isLoading: controller.isCatLoading.value,
                          validator: (value) {
                            if (value == null) {
                              return 'Select Category';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownCategory = data;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Tooltip(
                      message: controller.editId == '' ? 'Create' : 'Update',
                      child: CommonButton(
                        isLoading: controller.isLoading.value,
                        width: Responsive.isDesktop(context)
                            ? size.width * .1
                            : size.width * 0.25,
                        onClick: () {
                          if (controller.formkey.currentState!.validate()) {
                            if (controller.editId == '') {
                              controller.add();
                            } else {
                              controller.edit();
                            }
                          }
                        },
                        label: controller.editId == '' ? 'Create' : 'Update',
                      ).paddingOnly(right: 40),
                    ),
                  ),
                ],
              ).paddingOnly(left: 10),
            ),
          )
        ]),
      ),
    );
  }
}
