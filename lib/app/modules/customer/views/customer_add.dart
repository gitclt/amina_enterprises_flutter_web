import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/common_regex.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/customer/controllers/customer_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerAdd extends GetView<CustomerController> {
  const CustomerAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Customer / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.customer);
            },
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Form(
              key: controller.formkey,
              child: Wrap(
                spacing: 12,
                runSpacing: 15,
                children: [
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.nameController,
                    label: 'Name',
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.codeController,
                    label: 'Code',
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Code';
                      }
                      return null;
                    },
                  ),
                  DropDown3Widget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    label: 'Customer Type',
                    hint: '--Customer Type--',
                    selectedItem:
                        controller.sdType.id == null ? null : controller.sdType,
                    items: controller.typeDropList,
                    onChanged: (data) async {
                      if (data == null) return;
                      controller.sdType = data;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Select Type';
                      }
                      return null;
                    },
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.passwordController,
                    label: 'Password',
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.emailController,
                    label: 'Email',
                    validator: Validators.validateEmail,
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.mobileController,
                    inputFormat: true,
                    maxLengthLimit: 10,
                    label: 'Mobile',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Mobile Number';
                      } else if (value.isNotEmpty && value.length < 10) {
                        return 'Mobile number should contain 10-digit number';
                      }
                      return null;
                    },
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.addressController,
                    label: 'Address',
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Enter Address';
                    //   }
                    //   return null;
                    // },
                  ),
                  Obx(
                    () => DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.18
                          : size.width * .32,
                      label: 'State',
                      hint: '--Select State--',
                      selectedItem: controller.sdState.id == null
                          ? null
                          : controller.sdState,
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
                        controller.sdState = data;
                        controller.getDistrict();
                      },
                    ),
                  ),
                  Obx(
                    () => DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.18
                          : size.width * .32,
                      label: 'District',
                      hint: '--Select District--',
                      selectedItem: controller.sdDistrict.id == null
                          ? null
                          : controller.sdDistrict,
                      items: controller.districtDropList,
                      isLoading: controller.isDistrictLoading.value,
                      validator: (value) {
                        if (value == null) {
                          return 'Select District';
                        }
                        return null;
                      },
                      onChanged: (data) async {
                        if (data == null) return;
                        controller.sdDistrict = data;
                      },
                    ),
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.placeController,
                    label: 'Place',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Place';
                      }
                      return null;
                    },
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.pincodeController,
                    label: 'Pincode',
                    inputFormat: true,
                    maxLengthLimit: 6,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Pincode';
                      }
                      return null;
                    },
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
