import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductEditPopup extends StatelessWidget {
  final Function onChange;
  final ProductController controller;
  const ProductEditPopup({
    super.key,
    required this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 5,
      shadowColor: Colors.black,
      //  backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(color: Colors.white),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
              maxHeight: MediaQuery.of(context).size.width * 0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
              ),
              Form(
                // key: controller.formkey,
                child: Wrap(
                  spacing: Responsive.isDesktop(context)
                      ? size.width * 0.03
                      : Responsive.isMobile(context)
                          ? 50
                          : 50,
                  runSpacing: 20,
                  children: [
                    //       Row(children: [
                    //           controller.pickedFilePath1.isEmpty

                    //                       ? NetworkImage(controller.pickedFilePath1.value)
                    //                       :     Container(
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(4),
                    //     border: Border.all(color: AppColor.boxBorderColor),
                    //   ),
                    //   child:
                    //  svgWidget('assets/svg_icons/demmy_image.svg', size: 100),
                    //   ),

                    //            ],)  ,

                    Obx(() => Row(
                          children: [
                            controller.pickedFilePath1.isNotEmpty &&
                                    Uri.parse(controller.pickedFilePath1.value)
                                        .isAbsolute
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: Image.network(
                                      errorBuilder:
                                          (context, exception, stackTrack) =>
                                              Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.error,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Image not found',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      controller.pickedFilePath1
                                          .value, // Load from network
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: svgWidget(
                                        'assets/svg_icons/demmy_image.svg',
                                        size: 100), // Placeholder
                                  ),
                            const SizedBox(width: 10), // Spacing between images
                            controller.pickedFilePath2.isNotEmpty &&
                                    Uri.parse(controller.pickedFilePath2.value)
                                        .isAbsolute
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: Image.network(
                                      errorBuilder:
                                          (context, exception, stackTrack) =>
                                              Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.error,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Image not found',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      controller.pickedFilePath2.value,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: svgWidget(
                                        'assets/svg_icons/demmy_image.svg',
                                        size: 100),
                                  ),
                            const SizedBox(width: 10), // Spacing between images
                            controller.pickedFilePath3.isNotEmpty &&
                                    Uri.parse(controller.pickedFilePath3.value)
                                        .isAbsolute
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: Image.network(
                                      errorBuilder:
                                          (context, exception, stackTrack) =>
                                              Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.error,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Image not found',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      controller.pickedFilePath3.value,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: svgWidget(
                                        'assets/svg_icons/demmy_image.svg',
                                        size: 100),
                                  ),
                            const SizedBox(width: 10), // Spacing between images
                            controller.pickedFilePath4.isNotEmpty &&
                                    Uri.parse(controller.pickedFilePath4.value)
                                        .isAbsolute
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: Image.network(
                                      errorBuilder:
                                          (context, exception, stackTrack) =>
                                              Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.error,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Image not found',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      controller.pickedFilePath4.value,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppColor.boxBorderColor),
                                    ),
                                    child: svgWidget(
                                        'assets/svg_icons/demmy_image.svg',
                                        size: 100),
                                  ),
                          ],
                        )),

                    DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
                      label: 'Sub Category',
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
                    ),
                    // ),
                    // Obx(
                    //               () =>
                    DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
                      label: 'Color',
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
                    ),
                    // ),
                    //  Obx(
                    //             () =>
                    DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
                      label: 'Size',
                      hint: '--Select Size--',
                      selectedItem: controller.sdSize.id == null
                          ? null
                          : controller.sdSize,
                      items: controller.sizeDropList,
                      onChanged: (data) async {
                        if (data == null) return;
                        controller.sdSize = data;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Size';
                        }
                        return null;
                      },
                    ),
                    // ),
                    AddTextFieldWidget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
                      textController: controller.mrpController,
                      label: 'MRP',
                      visible: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'MRP';
                        }
                        return null;
                      },
                    ),
                    // Obx(
                    //               () =>
                    DropDown3Widget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
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
                    // ),
                    AddTextFieldWidget(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.22
                          : size.width * .32,
                      textController: controller.stockController,
                      label: 'Stock',
                      visible: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Stock';
                        }
                        return null;
                      },
                    ),

                    // Adding the custom radio buttons with checkbox-like style
                    SizedBox(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.73 / 2
                          : size.width * .8,
                      height: size.height * 0.075,
                      child: Obx(() => Row(
                            children: [
                              // Active radio button (styled as checkbox)
                              GestureDetector(
                                onTap: () {
                                  controller.isActive.value = true;
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.isActive.value
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: controller.isActive.value
                                          ? AppColor.primary
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Active',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              // Inactive radio button (styled as checkbox)
                              GestureDetector(
                                onTap: () {
                                  controller.isActive.value = false;
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      !controller.isActive.value
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: !controller.isActive.value
                                          ? AppColor.primary
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Inactive',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonButton(
                          isLoading: controller.isLoading.value,
                          width: Responsive.isDesktop(context)
                              ? size.width * .1
                              : size.width * 0.25,
                          onClick: () {
                            controller.editProductItem();
                          },
                          label: 'Save Changes',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
