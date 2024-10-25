import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/main_category/controllers/main_category_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCategoryAdd extends GetView<MainCategoryController> {
  const MainCategoryAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Master / Main-Category / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.mainCategory);
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddTextFieldWidget(
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.35
                              : size.width * .32,
                          textController: controller.nameController,
                          label: 'Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter  Name';
                            }
                            return null;
                          },
                        ).paddingOnly(left: 15),
                        SizedBox(
                          width: size.width * 0.035,
                        ),
                        AddTextFieldWidget(
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.35
                              : size.width * .32,
                          textController: controller.imgCtr,
                          readonly: true,
                          onTap: () {
                            controller.picImage();
                          },
                          label: 'Image',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Select  Image';
                            }
                            return null;
                          },
                        ).paddingOnly(left: 15),
                        SizedBox(
                          width: size.width * 0.035,
                        ),
                      ],
                    ),
                    CommonButton(
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
                    ).paddingOnly(right: 40, top: 30, left: 15),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
