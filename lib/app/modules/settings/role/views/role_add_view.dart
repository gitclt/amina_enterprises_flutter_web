import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/role/controllers/role_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class RoleAddView extends GetView<RoleController> {
  const RoleAddView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HomeAppBar(
          title:
              'Home / Master / Role / ${controller.editId == '' ? 'Add' : 'Update'}',
          onClick: () {
           // Get.rootDelegate.toNamed(Routes.role);
          },
          label: 'view_all'.tr,
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: controller.formkey,
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: Responsive.isDesktop(context)
                  ? size.width * 0.1
                  : Responsive.isMobile(context)
                      ? 100
                      : 20,
              runSpacing: 15,
              children: [
                Row(
                  children: [
                    AddTextFieldWidget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.35
                          : size.width * .32,
                      textController: controller.nameController,
                      label: 'KVN Role',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Role Name';
                        }
                        return null;
                      },
                    ).paddingOnly(left: 15),
                    SizedBox(
                      width: size.width * 0.035,
                    ),
                    Obx(
                      () => SizedBox(
                        width: Responsive.isDesktop(context)
                            ? size.width * 0.35
                            : size.width * .32,
                        child: DropDown3Widget(
                          label: 'Role',
                          hint: '--Select Role--',
                          selectedItem: controller.selectedRoleId.id == null
                              ? null
                              : controller.selectedRoleId,
                          onChanged: (value) async {
                            controller.selectedRoleId = value!;
                            controller.roleId = value.id ?? '';
                            await controller.getPrivilage();
                          },
                          items: controller.roleDropList,
                          isLoading: controller.isRoleLoading.value,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => controller.isPrivilageLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.rolePrivilageList.isEmpty
                        ? Center(
                            child:
                                boldText('No Data Found').paddingOnly(top: 50),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: size.height * 0.52,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(children: [
                                      ColumnHeaderWidget(
                                        width: size.width * 0.07,
                                        label: 'Sl No.',
                                      ),
                                      ColumnHeaderWidget(
                                          label: 'Module',
                                          width: size.width * 0.16),
                                      ColumnHeaderWidget(
                                          label: 'Menu',
                                          width: size.width * 0.16),
                                      ColumnHeaderWidget(
                                          label: 'Add',
                                          width: size.width * 0.06),
                                      ColumnHeaderWidget(
                                          label: 'View',
                                          width: size.width * 0.06),
                                      ColumnHeaderWidget(
                                          label: 'Edit',
                                          width: size.width * 0.06),
                                      ColumnHeaderWidget(
                                          label: 'Delete',
                                          width: size.width * 0.06),
                                      // const Expanded(
                                      //     child: ColumnHeaderWidget(
                                      //   label: '',
                                      // ))
                                    ]),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: controller
                                              .rolePrivilageList.length,
                                          itemBuilder: ((context, index) {
                                            final item = controller
                                                .rolePrivilageList[index];
                                            const evenColor = Colors.white;
                                            final oddColor =
                                                AppColor.grey.withOpacity(0.2);

                                            final bgColor = index % 2 == 0
                                                ? oddColor
                                                : evenColor;
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    ColumnWidget(
                                                      text: columnText(
                                                          (index + 1)
                                                              .toString(),
                                                          fontSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      alignment:
                                                          Alignment.center,
                                                      width: size.width * 0.07,
                                                      color: bgColor,
                                                    ),
                                                    ColumnWidget(
                                                      text: columnText(
                                                          item.module ?? '',
                                                          fontSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      width: size.width * 0.16,
                                                      color: bgColor,
                                                    ),
                                                    ColumnWidget(
                                                      text: columnText(
                                                          item.menu ?? '',
                                                          fontSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      width: size.width * 0.16,
                                                      color: bgColor,
                                                    ),
                                                    ColumnWidget(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            size.width * 0.06,
                                                        text: Obx(
                                                          () => Checkbox(
                                                              value: item.isAdd
                                                                          .value ==
                                                                      0
                                                                  ? false
                                                                  : true,
                                                              onChanged:
                                                                  (value) {
                                                                item.isAdd
                                                                        .value =
                                                                    value ==
                                                                            false
                                                                        ? 0
                                                                        : 1;
                                                              }),
                                                        )),
                                                    ColumnWidget(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            size.width * 0.06,
                                                        text: Obx(
                                                          () => Checkbox(
                                                              value: item.isView
                                                                          .value ==
                                                                      0
                                                                  ? false
                                                                  : true,
                                                              onChanged:
                                                                  (value) {
                                                                item.isView
                                                                        .value =
                                                                    value ==
                                                                            false
                                                                        ? 0
                                                                        : 1;
                                                              }),
                                                        )),
                                                    ColumnWidget(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            size.width * 0.06,
                                                        text: Obx(
                                                          () => Checkbox(
                                                              value: item.isEdit
                                                                          .value ==
                                                                      0
                                                                  ? false
                                                                  : true,
                                                              onChanged:
                                                                  (value) {
                                                                item.isEdit
                                                                        .value =
                                                                    value ==
                                                                            false
                                                                        ? 0
                                                                        : 1;
                                                              }),
                                                        )),
                                                    ColumnWidget(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            size.width * 0.06,
                                                        text: Obx(
                                                          () => Checkbox(
                                                              value: item.isDelete
                                                                          .value ==
                                                                      0
                                                                  ? false
                                                                  : true,
                                                              onChanged:
                                                                  (value) {
                                                                item.isDelete
                                                                        .value =
                                                                    value ==
                                                                            false
                                                                        ? 0
                                                                        : 1;
                                                              }),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            );
                                          })),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(() => CommonButton(
                                            isLoading:
                                                controller.isAddLoading.value,
                                            width: Responsive.isDesktop(context)
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .1
                                                : null,
                                            onClick: () {
                                              if (controller
                                                  .formkey.currentState!
                                                  .validate()) {
                                                if (controller.editId == '') {
                                                  controller.addRole();
                                                } else {
                                                  controller.editApi();
                                                }
                                              }
                                            },
                                            label: controller.editId == ''
                                                ? 'Save'
                                                : 'Update')
                                        .paddingOnly(right: 20))
                                  ],
                                ),
                              ),
                            ),
                          )),
              ]),
        )
      ]),
    );
  }
}
