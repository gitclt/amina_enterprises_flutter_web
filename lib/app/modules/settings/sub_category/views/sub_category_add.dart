import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/sub_category/controllers/sub_category_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryAdd extends GetView<SubCategoryController> {
  const SubCategoryAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HomeAppBar(
          title: 'Home / Master / Sub-Category / Add',
          onClick: () {
            Get.rootDelegate.toNamed(Routes.subCategory);
          },
          label: 'view_all'.tr,
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
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
                    Obx(
                      () => DropDown3Widget(
                        label: 'Category',
                        hint: controller.subnameController.text.isEmpty
                            ? '--Select Category--'
                            : controller.subnameController.text,
                        selectedItem: controller.sdsubCategory.id == null
                            ? null
                            : controller.sdsubCategory,
                        items: controller.productCatDropList,
                        isLoading: controller.isAddLoading.value,
                        validator: (value) {
                          if (value == null) {
                            return 'Select Category';
                          }
                          return null;
                        },
                        onChanged: (data) async {
                          if (data == null) return;
                          controller.sdsubCategory = data;
                        },
                      ),
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
                        controller.addsubCategory();
                      } else {
                        controller.editsubCategory();
                      }
                    }
                  },
                  label: controller.editId == '' ? 'Create' : 'Update',
                ).paddingOnly(right: 40, top: 30, left: 15),
              ]),
        )
      ]),
    );
  }
}
