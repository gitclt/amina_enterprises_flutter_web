import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down_multi_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
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
          Obx(() => controller.isMaincatLoading.value
              ? Center()
              : DropDown3Widget(
                  label: 'Main Category',
                  hint: '--Select Category--',
                  selectedItem: controller.sdMainCat.id == null
                      ? null
                      : controller.sdMainCat,
                  items: controller.mainCatDropList,
                  isLoading: controller.isMaincatLoading.value,
                  onChanged: (data) async {
                    if (data == null) return;
                    controller.sdMainCat = data;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Main Category';
                    }
                    return null;
                  },
                )),
          DropDown3Widget(
            label: 'Category',
            hint: '--Select Category--',
            selectedItem: controller.sdCat.id == null ? null : controller.sdCat,
            items: controller.categoryDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdCat = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Category';
              }
              return null;
            },
          ),
          AddTextFieldWidget(
            textController: controller.artnoController,
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
                controller.sdBrand.id == null ? null : controller.sdBrand,
            items: controller.brandDropList,
            onChanged: (data) async {
              if (data == null) return;
              controller.sdBrand = data;
            },
            validator: (value) {
              if (value == null) {
                return 'Select Brand';
              }
              return null;
            },
          ),
          AddTextFieldWidget(
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
          Obx(
            () => DropDownMultiWidget(
              label: "Division",
              hint: '--Select Division--',
              items: controller.divisionDropList,
              selectedItem: controller.dropdownDivisionList.isEmpty
                  ? []
                  : controller.dropdownDivisionList,
              isLoading: controller.isDivisionLoading.value,
              validator: (value) {
                if (value == null) {
                  return 'Select Branch';
                }
                return null;
              },
              onChanged: (data) {
                if (data.isEmpty) return;

                controller.dropdownDivisionList.clear();

                controller.dropdownDivisionList.addAll(data.map(
                    (e) => DropDownModel(id: e!.id.toString(), name: e.name)));
              },
            ),
          ),
          Obx(() => SizedBox(
                width: Responsive.isDesktop(context)
                    ? size.width * 0.73 / 2
                    : size.width * .8,
                height: size.height * 0.075,
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: AppColor.primary,
                      value: controller.islaunchChecked.value,
                      onChanged: (value) {
                        controller.launchCheckbox();
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('New Launch')
                  ],
                ),
              )),
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
                  if (controller.formkey.currentState!.validate()) {
                    if (controller.editId == '') {
                      controller.addProduct();
                    } else {
                      controller.editProduct();
                    }
                  }
                },
                label: controller.editId == '' ? 'Next' : 'Update',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
