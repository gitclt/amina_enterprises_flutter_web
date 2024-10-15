import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/district/controllers/district_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictAdd extends GetView<DistrictController> {
  const DistrictAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HomeAppBar(
          title: 'Home / Master / District / Add',
          onClick: () {
            Get.rootDelegate.toNamed(Routes.district);
          },
          label: 'view_all'.tr,
        ),
        const SizedBox(
          height: 20,
        ),
        CommonPagePadding(
          child: PageContainer(
            child: Form(
              key: controller.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => DropDown3Widget(
                          label: 'State',
                          hint: '--Select State--',
                          selectedItem: controller.dropDownState.id == null
                              ? null
                              : controller.dropDownState,
                          items: controller.stateDropList,
                          isLoading: controller.isStateLoading.value,
                          validator: (value) {
                            if (value == null) {
                              return 'Select State';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownState = data;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      AddTextFieldWidget(
                        width: Responsive.isDesktop(context)
                            ? size.width * 0.35
                            : size.width * .32,
                        textController: controller.nameController,
                        label: 'District Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter District Name';
                          }
                          return null;
                        },
                      ).paddingOnly(left: 15),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                  ).paddingOnly(right: 40),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
