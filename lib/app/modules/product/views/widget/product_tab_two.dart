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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductTabTwo extends GetView<ProductController> {
  const ProductTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      // key: controller.formkey,
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
            AttributesTable(controller: controller),
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
                          columnText('404', 20),
                          boldText('Gents / V- Strap',
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
            ItemSelectTable(
              controller: controller,
            ),
            Row(
              children: [
                DropDown3Widget(
                  label: 'State',
                  hint: '--Select State--',
                  selectedItem:
                      controller.sdStatus.id == null ? null : controller.sdStatus,
                  items: controller.statusDropList,
                  onChanged: (data) async {
                    if (data == null) return;
                    controller.sdStatus = data;
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
            CommonButton(
              isLoading: controller.isLoading.value,
              width: Responsive.isDesktop(context)
                  ? size.width * .1
                  : size.width * 0.25,
              onClick: () {
                if (controller.formkey.currentState!.validate()) {
                  if (controller.editId == '') {
                    controller.addProduct();
                  } else {
                    //  controller.edit();
                  }
                }
              },
              label: controller.editId == '' ? 'Save' : 'Update',
            ).paddingOnly(right: 40),
          ],
        ),
      ),
    );
  }
}
