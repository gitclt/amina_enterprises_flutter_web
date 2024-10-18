import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductTabOne extends GetView<ProductController> {
  const ProductTabOne({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: controller.formkey,
      child: Wrap(
        spacing: Responsive.isDesktop(context)
            ? size.width * 0.03
            : Responsive.isMobile(context)
                ? 50
                : 50,
        runSpacing: 20,
        children: [
          DropDown3Widget(
            label: 'Main Category',
            hint: '--Select Category--',
            selectedItem:
                controller.sdStatus.id == null ? null : controller.sdStatus,
            items: controller.statusDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdStatus = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Status';
              }
              return null;
            },
          ),
          DropDown3Widget(
            label: 'Category',
            hint: '--Select Category--',
            selectedItem:
                controller.sdStatus.id == null ? null : controller.sdStatus,
            items: controller.statusDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdStatus = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Status';
              }
              return null;
            },
          ),
          DropDown3Widget(
            label: 'Construction',
            hint: '--Select Construction--',
            selectedItem:
                controller.sdStatus.id == null ? null : controller.sdStatus,
            items: controller.statusDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdStatus = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Status';
              }
              return null;
            },
          ),
          AddTextFieldWidget(
            // textController: controller.codeController,
            label: 'Art No',
            visible: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Art No';
              }
              return null;
            },
          ),
          DropDown3Widget(
            label: 'Brand',
            hint: '--Select Brand--',
            selectedItem:
                controller.sdStatus.id == null ? null : controller.sdStatus,
            items: controller.statusDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdStatus = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Status';
              }
              return null;
            },
          ),
          AddTextFieldWidget(
            // textController: controller.nameController,
            label: 'Name',
            visible: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Name';
              }
              return null;
            },
          ),
          DropDown3Widget(
            label: 'Status',
            hint: '--Select Status--',
            selectedItem:
                controller.sdStatus.id == null ? null : controller.sdStatus,
            items: controller.statusDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdStatus = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Status';
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
                  //    controller.add();
                } else {
                  //  controller.edit();
                }
              }
            },
            label: controller.editId == '' ? 'Next' : 'Update',
          ).paddingOnly(right: 40),
        ],
      ),
    );
  }
}
