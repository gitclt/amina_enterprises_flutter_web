import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/attributes_select_table.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/attributes_table.dart';
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
              onTap: () {},
              child: Row(
                children: [
                  Column(
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
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.boxBorderColor)),
                    child: svgWidget('assets/svg_icons/demmy_image.svg'),
                  )
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
