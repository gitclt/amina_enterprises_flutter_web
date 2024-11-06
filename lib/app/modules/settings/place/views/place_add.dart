import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/place/controllers/place_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceAdd extends GetView<PlaceController> {
  const PlaceAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Master / Place / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.district);
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => DropDown3Widget(
                          width: size.width * 0.23,
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
                             controller.getDistrict();
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                       Obx(
                        () => DropDown3Widget(
                          width: size.width * 0.23,
                          label: 'District',
                          hint: '--Select District--',
                          selectedItem: controller.dropDownDistrict.id == null
                              ? null
                              : controller.dropDownDistrict,
                          items: controller.districtDropList,
                          isLoading: controller.isDisLoading.value,
                          validator: (value) {
                            if (value == null) {
                              return 'Select District';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownDistrict = data;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      AddTextFieldWidget(
                        width: Responsive.isDesktop(context)
                            ? size.width * 0.23
                            : size.width * .32,
                        textController: controller.nameController,
                        label: 'Place Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Place Name';
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
          )
        ]),
      ),
    );
  }
}
