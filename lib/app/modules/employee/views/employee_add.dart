import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/common_regex.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dates/select_date_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/employee/controllers/employee_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeAdd extends GetView<EmployeeController> {
  const EmployeeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Employee / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.employee);
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
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 15,
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
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.emailController,
                    label: 'Email',
                    visible: true,
                   validator: Validators.validateEmail,
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
                    textController: controller.mobileController,
                    label: 'Mobile',
                    inputFormat: true,
                    maxLengthLimit: 10,
                    visible: true,
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
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Address';
                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => DropDown3Widget(
                      width: size.width * 0.18,
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
                  Obx(
                    () => DropDown3Widget(
                      width: size.width * 0.18,
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
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.locController,
                    label: 'Location',
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Location';
                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => DropDown3Widget(
                      width: size.width * 0.18,
                      label: 'Role',
                      hint: '--Select Role--',
                      selectedItem: controller.dropDownRole.id == null
                          ? null
                          : controller.dropDownRole,
                      items: controller.roleDropList,
                      isLoading: controller.isStateLoading.value,
                      validator: (value) {
                        if (value == null) {
                          return 'Select Role';
                        }
                        return null;
                      },
                      onChanged: (data) async {
                        if (data == null) return;
                        controller.dropDownRole = data;
                      },
                    ),
                  ),
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.18
                        : size.width * .32,
                    textController: controller.jDateController,
                    label: 'Joining Date',
                    hintText: '1995-10-22',
                    visible: true,
                     suffixIcon: IconButton(
                        icon:
                            const Icon(Icons.calendar_today_outlined, size: 20),
                        onPressed: () async {
                          selectDate(context, controller.jDateController);
                        },
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Joining Date';
                      }
                      return null;
                    },
                  ),
                  DropDown3Widget(
                    width: size.width * 0.18,
                    label: 'Status',
                    hint: '--Select Status--',
                    selectedItem: controller.dropDownStatus.id == null
                        ? null
                        : controller.dropDownStatus,
                    items: controller.statusDropList,
                    validator: (value) {
                      if (value == null) {
                        return 'Select District';
                      }
                      return null;
                    },
                    onChanged: (data) async {
                      if (data == null) return;
                      controller.dropDownStatus = data;
                    },
                  ),
                  Obx(
                    () => DropDown3Widget(
                      width: size.width * 0.18,
                      label: 'Designation',
                      hint: '--Select Designation--',
                      selectedItem: controller.dropDownDesignate.id == null
                          ? null
                          : controller.dropDownDesignate,
                      items: controller.designationDropList,
                      isLoading: controller.isStateLoading.value,
                      validator: (value) {
                        if (value == null) {
                          return 'Select Designation';
                        }
                        return null;
                      },
                      onChanged: (data) async {
                        if (data == null) return;
                        controller.dropDownDesignate = data;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
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
                ],
              ).marginOnly(left: 10),
            ),
          )
        ]),
      ),
    );
  }
}
