import 'dart:io';

import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/pro_item_table_view.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/product_size_table.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductTabTwo extends GetView<ProductController> {
  const ProductTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: controller.formkey1,
      child: Obx(() => controller.isLoading.value
          ? const SizedBox()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Wrap(
                spacing: Responsive.isDesktop(context)
                    ? size.width * 0.03
                    : Responsive.isMobile(context)
                        ? 50
                        : 50,
                runSpacing: 20,
                children: [
                  Obx(
                    () => controller.detailList.isEmpty
                        ? const SizedBox()
                        : AttributesTable(controller: controller),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        // width: size.width * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.boxBorderColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                svgWidget('assets/svg_icons/shoe.svg'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                columnText(controller.nameController.text, 20),
                                boldText(controller.artnoController.text,
                                    fontWeight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Obx(() => DropDown3Widget(
                        label: 'Sub Category',
                        isLoading: controller.isSubCatLoading.value,
                        hint: '--Select Category--',
                        selectedItem: controller.sdSubCat.id == null
                            ? null
                            : controller.sdSubCat,
                        items: controller.subcatDropList,
                        onChanged: (data) async {
                          if (data == null) return;
                          controller.sdSubCat = data;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Select Sub Category';
                          }
                          return null;
                        },
                      )),

                  Obx(() => DropDown3Widget(
                        label: 'Color',
                        isLoading: controller.isColorLoading.value,
                        hint: '--Select Color--',
                        selectedItem: controller.sdColor.id == null
                            ? null
                            : controller.sdColor,
                        items: controller.colorDropList,
                        onChanged: (data) async {
                          if (data == null) return;
                          controller.sdColor = data;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Select Color';
                          }
                          return null;
                        },
                      )),
                  controller.sizeList.isEmpty
                      ? const SizedBox()
                      : ItemSelectTable(
                          controller: controller,
                        ),
                  Row(
                    children: [
                      Obx(
                        () => DropDown3Widget(
                          isLoading: controller.isStateLoading.value,
                          label: 'State',
                          hint: '--Select State--',
                          selectedItem: controller.sdState.id == null
                              ? null
                              : controller.sdState,
                          items: controller.stateDropList,
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.sdState = data;
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Select State';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  InkWell(
                    // onTap: () {
                    //   controller.pickImage();
                    // },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Upload Image',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.textGrayColor,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(color: AppColor.primary),
                                ).paddingOnly(left: 5)
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                ImageContainer(
                                  controller: controller,
                                  ontap: () {
                                    controller.pickImage(1);
                                  },
                                  imageIndex: 1,
                                ),
                                ImageContainer(
                                  controller: controller,
                                  ontap: () {
                                    controller.pickImage(2);
                                  },
                                  imageIndex: 2,
                                ),
                                ImageContainer(
                                  controller: controller,
                                  ontap: () {
                                    controller.pickImage(3);
                                  },
                                  imageIndex: 3,
                                ),
                                ImageContainer(
                                  controller: controller,
                                  ontap: () {
                                    controller.pickImage(4);
                                  },
                                  imageIndex: 4,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonButton(
                            isLoading: controller.isLoading.value,
                            width: Responsive.isDesktop(context)
                                ? size.width * .1
                                : size.width * 0.25,
                            onClick: () {
                              if (controller.formkey1.currentState!
                                  .validate()) {
                                // if (controller.editId == '') {
                                controller.addProductItem();
                                // } else {

                                // }
                              }
                            },
                            label: controller.editId == '' ? 'Save' : 'Update',
                          ),
                        ],
                      ))
                ],
              ),
            )),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final VoidCallback ontap;
  final int imageIndex;

  const ImageContainer({
    super.key,
    required this.controller,
    required this.ontap,
    required this.imageIndex, // Add imageIndex
  });

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColor.boxBorderColor),
          ),
          child: Obx(() {
            if (GetPlatform.isWeb) {
              // Show selected image bytes for web based on imageIndex
              if (imageIndex == 1 &&
                  controller.pickedFileBytes1.value != null) {
                return Image.memory(
                  controller.pickedFileBytes1.value!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 2 &&
                  controller.pickedFileBytes2.value != null) {
                return Image.memory(
                  controller.pickedFileBytes2.value!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 3 &&
                  controller.pickedFileBytes3.value != null) {
                return Image.memory(
                  controller.pickedFileBytes3.value!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 4 &&
                  controller.pickedFileBytes4.value != null) {
                return Image.memory(
                  controller.pickedFileBytes4.value!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              }
            } else {
              // Show selected image file for mobile/desktop based on imageIndex
              if (imageIndex == 1 &&
                  controller.pickedFilePath1.value.isNotEmpty) {
                return Image.file(
                  File(controller.pickedFilePath1.value),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 2 &&
                  controller.pickedFilePath2.value.isNotEmpty) {
                return Image.file(
                  File(controller.pickedFilePath2.value),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 3 &&
                  controller.pickedFilePath3.value.isNotEmpty) {
                return Image.file(
                  File(controller.pickedFilePath3.value),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else if (imageIndex == 4 &&
                  controller.pickedFilePath4.value.isNotEmpty) {
                return Image.file(
                  File(controller.pickedFilePath4.value),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              }
            }
            // Default placeholder when no image is selected
            return svgWidget('assets/svg_icons/demmy_image.svg', size: 100);
          }),
        ),
      ),
    );
  }
}
