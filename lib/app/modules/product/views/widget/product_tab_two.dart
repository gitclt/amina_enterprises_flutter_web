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
      child: SingleChildScrollView(
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
                  width: size.width * 0.13,
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
            DropDown3Widget(
              label: 'Sub Category',
              hint: '--Select Category--',
              selectedItem:
                  controller.sdSubCat.id == null ? null : controller.sdSubCat,
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
            DropDown3Widget(
              label: 'Color',
              hint: '--Select Color--',
              selectedItem:
                  controller.sdColor.id == null ? null : controller.sdColor,
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
            controller.sizeList.isEmpty
                ? const SizedBox()
                : ItemSelectTable(
                    controller: controller,
                  ),
            Row(
              children: [
                DropDown3Widget(
                  label: 'State',
                  hint: '--Select State--',
                  selectedItem:
                      controller.sdState.id == null ? null : controller.sdState,
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
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
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
                        height: size.height * 0.03,
                      ),

                      // Row(
                      //   children: [
                      //     ImageContainer(
                      //         controller: controller, index: 1), // For image1
                      //     ImageContainer(
                      //         controller: controller, index: 2), // For image2
                      //     ImageContainer(
                      //         controller: controller, index: 3), // For image3
                      //     ImageContainer(
                      //         controller: controller, index: 4), // For image4
                      //   ],
                      // ),
                      Row(
                        children: [
                          ImageContainer(
                            controller: controller,
                            ontap: () {
                              controller.pickImage(1);
                            },
                          ),
                          ImageContainer(controller: controller,
                            ontap: () {
                              controller.pickImage(2);
                            },
                          ),
                          ImageContainer(controller: controller,
                            ontap: () {
                              controller.pickImage(3);
                            },
                          ),
                          ImageContainer(controller: controller,
                            ontap: () {
                              controller.pickImage(4);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
                    if (controller.formkey.currentState!.validate()) {
                      // if (controller.editId == '') {
                      controller.addProductItem();
                      // } else {

                      // }
                    }
                  },
                  label: controller.editId == '' ? 'Save' : 'Update',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
 final VoidCallback ontap;
  const ImageContainer({
    super.key,
    required this.controller,
    required this.ontap,
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
          child:
           Obx(() {
            if (GetPlatform.isWeb) {
              // Show selected image bytes for web
              if (controller.pickedFileBytes.value != null) {
                return Image.memory(
                  controller.pickedFileBytes.value!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              }
            } else {
              // Show selected image file for mobile/desktop
              if (controller.pickedFilePath.value.isNotEmpty) {
                return Image.file(
                  File(controller.pickedFilePath.value),
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

// class ImageContainer extends StatelessWidget {
//   final ProductController controller;
//   final int index; // Pass the index to identify the image slot (1, 2, 3, or 4)

//   const ImageContainer({
//     Key? key,
//     required this.controller,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//      String? imagePath = '';
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           controller
//               .pickImage(index); // Pass the index to pick the correct image
//         },
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(color: AppColor.boxBorderColor),
//           ),
//           child:
//             Obx(() {
//           //   String? imagePath = '';
//           //   if (index == 1) imagePath = controller.imageName1;
//           //   if (index == 2) imagePath = controller.imageName2;
//           //   if (index == 3) imagePath = controller.imageName3;
//           //   if (index == 4) imagePath = controller.imageName4;

//             if (GetPlatform.isWeb) {
//               // For web, check if bytes are available
//               if (controller.pickedFileBytes.value != null) {
//                 return Image.memory(
//                   controller.pickedFileBytes.value!,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 );
//               }
//             } else {
//               // For mobile/desktop, check if file path is available
//               if (imagePath != null && imagePath.isNotEmpty) {
//                 return Image.file(
//                   File(imagePath),
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 );
//               }
//             }

//             // Default placeholder when no image is selected
//             return svgWidget('assets/svg_icons/demmy_image.svg', size: 100);
//           }),
//         ),
//       ),
//     );
//   }
// }
